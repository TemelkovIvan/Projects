package Calculation.Calculator;

import com.lowagie.text.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller
@SessionAttributes("name")
public class KSSController extends BaseController {

    @Autowired
    CasesService service = new CasesService();

    @Autowired
    private SMRService serviceSMR;

    @Autowired
    private CasesService serviceByCase;

    @Autowired
    CasesRepository casesRepository;

    Cases newCase = new Cases();

    @Autowired
    SMRRepository repository;

    @RequestMapping(value="/list-smr",method = RequestMethod.GET)
    public ModelAndView showKSS(ModelMap model) {
        String name = (String) model.get("name");

        model.put("smr",repository.findAll(Sort.by(Sort.Direction.ASC, "position")));
        return this.view("list-smr");
    }

    @RequestMapping(value="/calculator",method = RequestMethod.GET)
    public ModelAndView showCalculator(ModelMap model) {

        model.put("smr",repository.findAll(Sort.by(Sort.Direction.ASC, "position")));
        return this.view("calculator");
    }

    @RequestMapping(value="/calculator",method = RequestMethod.POST)
    public ModelAndView addNewCase(ModelMap model,@Valid Cases newCase, @RequestParam int numberOfCase, @RequestParam String client,@RequestParam String address, @RequestParam int contract,
                                    @RequestParam int qty_1, @RequestParam int qty_2, @RequestParam int qty_3, @RequestParam int qty_4,
                                   @RequestParam double row_1, @RequestParam double row_2, @RequestParam double row_3, @RequestParam double row_4, @RequestParam double total) {

        ArrayList<Integer> SMR = new ArrayList<>();
        ArrayList<Double> Prices = new ArrayList<>();

        String name = (String) model.get("name");

        newCase.setUserName(name);
        newCase.setNumberOfCase(numberOfCase);
        newCase.setClient(client);
        newCase.setAddress(address);
        newCase.setContract(contract);
        SMR.add(0,qty_1);
        SMR.add(1,qty_2);
        SMR.add(2,qty_3);
        SMR.add(3,qty_4);
        newCase.setSMR(SMR);
        Prices.add(0,row_1);
        Prices.add(1,row_2);
        Prices.add(2,row_3);
        Prices.add(3,row_4);
        newCase.setPrices(Prices);
        newCase.setTotal(total);
        casesRepository.save(newCase);

        return this.view("home");
    }


    @RequestMapping(value="/search",method = RequestMethod.GET)
    public ModelAndView showSearchCase(ModelMap model) {

        model.put("cases", casesRepository.findAll());

        return this.view("search");
    }

    @RequestMapping(value="/search",method = RequestMethod.POST)
    public ModelAndView search(ModelMap model, @RequestParam(defaultValue="0") int number, @RequestParam String byName) {

        if (number > 0) {

            Cases byCase = this.casesRepository.findByNumberOfCase(number).orElse(null);

            if (!(byCase == null)) {

                model.put("smr", repository.findAll(Sort.by(Sort.Direction.ASC, "position")));
                model.put("client", byCase.getClient());
                model.put("address", byCase.getAddress());
                model.put("numberOfCase", byCase.getNumberOfCase());
                model.put("contract", byCase.getContract());
                model.put("cases", byCase.getSMR());
                model.put("prices", byCase.getPrices());

                return this.view("calculator_with_existing_case");
            }
        }

        if(!(byName == null)) {

            model.put("cases", casesRepository.findByUserName(byName));
            return this.view("search");
        }
        model.put("errorMessage", "Не се намират подадените данни");
        return this.view("search");
    }

    @RequestMapping(value="/calculator_change",method = RequestMethod.GET)
    public ModelAndView showCalcWithExistingCase(ModelMap model,@RequestParam(value="number") int number) {

        Cases byCase = this.casesRepository.findByNumberOfCase(number).orElse(null);

        if (!(byCase == null)) {

            model.put("smr", repository.findAll(Sort.by(Sort.Direction.ASC, "position")));
            model.put("client", byCase.getClient());
            model.put("address", byCase.getAddress());
            model.put("numberOfCase", byCase.getNumberOfCase());
            model.put("contract", byCase.getContract());
            model.put("cases", byCase.getSMR());
            model.put("prices", byCase.getPrices());

            return this.view("calculator_change");
        }

        model.put("errorMessage", "Не се намират подадените данни");
        return this.view("search");
    }

    @RequestMapping(value="/calculator_change",method = RequestMethod.POST)
        public ModelAndView showCalcWithExistingCase(ModelMap model, @RequestParam int numberOfCase, @RequestParam String client,@RequestParam String address, @RequestParam int contract,
                                                     @RequestParam int qty_1, @RequestParam int qty_2, @RequestParam int qty_3, @RequestParam int qty_4,
                                                     @RequestParam double row_1, @RequestParam double row_2, @RequestParam double row_3, @RequestParam double row_4, @RequestParam double total) {

        Cases byCase = this.casesRepository.findByNumberOfCase(numberOfCase).orElse(null);

        ArrayList<Integer> SMR = new ArrayList<>();
        ArrayList<Double> Prices = new ArrayList<>();

        byCase.setUserName((String) model.get("name"));
        byCase.setClient(client);
        byCase.setAddress(address);
        byCase.setContract(contract);
        SMR.add(0, qty_1);
        SMR.add(1, qty_2);
        SMR.add(2, qty_3);
        SMR.add(3, qty_4);
        byCase.setSMR(SMR);
        Prices.add(0, row_1);
        Prices.add(1,row_2);
        Prices.add(2,row_3);
        Prices.add(3,row_4);
        byCase.setPrices(Prices);
        byCase.setTotal(total);
        casesRepository.save(byCase);

        return this.redirect("/home");
    }

    @GetMapping("/pdfCase")
    public void exportToPDF(HttpServletResponse response, @RequestParam int numberOfCase) throws DocumentException, IOException {
        response.setContentType("application/pdf");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        Cases byCase = this.casesRepository.findByNumberOfCase(numberOfCase).orElse(null);

        String client = byCase.getClient();
        String address = byCase.getAddress();
        double total = byCase.getTotal();

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=case_" + numberOfCase + "_" + currentDateTime + ".pdf";
        response.setHeader(headerKey, headerValue);

        List<SMR> SMR = serviceSMR.listAll();
        ArrayList<Integer> listSMRbyCase = serviceByCase.listSMRbyCase(numberOfCase);
        ArrayList<Double> listPricesByCase = serviceByCase.listPricesByCase(numberOfCase);

        UserPDFExporter exporter = new UserPDFExporter(SMR, listSMRbyCase, listPricesByCase);
        exporter.export(response, numberOfCase, client, address, total);

    }
}
