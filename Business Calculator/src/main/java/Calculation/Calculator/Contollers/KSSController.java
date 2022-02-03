package Calculation.Calculator.Contollers;

import Calculation.Calculator.Entities.Cases;
import Calculation.Calculator.Entities.SMR;
import Calculation.Calculator.Exporters.ExcelExporter;
import Calculation.Calculator.Exporters.PDFExporter;
import Calculation.Calculator.Repositories.CasesRepository;
import Calculation.Calculator.Repositories.SMRRepository;
import Calculation.Calculator.Services.CasesService;
import Calculation.Calculator.Services.SMRService;
import com.lowagie.text.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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

    Date date = new Date(System.currentTimeMillis());

    @Autowired
    SMRRepository repository;

    @RequestMapping(value="/list-smr",method = RequestMethod.GET)
    public ModelAndView showKSS(ModelMap model) {

        model.put("smr",repository.findAll(Sort.by(Sort.Direction.ASC, "position")));
        return this.view("list-smr");
    }

    @RequestMapping(value="/calculator",method = RequestMethod.GET)
    public ModelAndView showCalculator(ModelMap model) {

        model.put("smr",repository.findAll(Sort.by(Sort.Direction.ASC, "position")));
        return this.view("calculator");
    }

    @RequestMapping(value="/calculator",method = RequestMethod.POST)
    public ModelAndView addNewCase(ModelMap model,@Valid Cases newCase, @RequestParam int numberOfCase, @RequestParam String client,@RequestParam String address,
                                   @RequestParam int contract, @RequestParam ArrayList<Double> qty, @RequestParam ArrayList<Double> row,  @RequestParam double total) {

        Cases byCase = this.casesRepository.findByNumberOfCase(numberOfCase).orElse(null);

        if(byCase == null) {
            if(!(qty == null) & total>0) {
                String name = (String) model.get("name");

                newCase.setUserName(name);
                newCase.setNumberOfCase(numberOfCase);
                newCase.setClient(client);
                newCase.setAddress(address);
                newCase.setContract(contract);
                newCase.setSMR(qty);
                newCase.setPrices(row);
                newCase.setTotal(total);
                newCase.setDate(date);
                casesRepository.save(newCase);

                return this.view("home");
            }
            model.put("numberOfCase",numberOfCase);
            model.put("client",client);
            model.put("address",address);
            model.put("contract",contract);
            model.put("cases",qty);
            model.put("prices",row);
            model.put("total",total);
            model.put("smr",repository.findAll(Sort.by(Sort.Direction.ASC, "position")));
            model.put("errorMessage", "Необходимо е да попълните данни за количествата");
            return this.view("calculator_change");
        }
        model.put("numberOfCase",numberOfCase);
        model.put("client",client);
        model.put("address",address);
        model.put("contract",contract);
        model.put("cases",qty);
        model.put("prices",row);
        model.put("total",total);
        model.put("smr",repository.findAll(Sort.by(Sort.Direction.ASC, "position")));
        model.put("errorMessage", "Вече има създаден такъв случай!");
        return this.view("calculator_change");

    }

    @RequestMapping(value="/search",method = RequestMethod.GET)
    public ModelAndView showSearchCase(ModelMap model) {

        String name = (String) model.get("name");
        model.put("cases", casesRepository.findByUserName(name));

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
                model.put("total", byCase.getTotal());

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
            model.put("total", byCase.getTotal());

            return this.view("calculator_change");
        }

        model.put("errorMessage", "Не се намират подадените данни");
        return this.view("search");
    }

    @RequestMapping(value="/calculator_change",method = RequestMethod.POST)
        public ModelAndView showCalcWithExistingCase(ModelMap model, @RequestParam int numberOfCase, @RequestParam String client,@RequestParam String address,
                                                     @RequestParam int contract, @RequestParam ArrayList<Double> qty, @RequestParam ArrayList<Double> row, @RequestParam double total) {

        Cases byCase = this.casesRepository.findByNumberOfCase(numberOfCase).orElse(null);

        byCase.setUserName((String) model.get("name"));
        byCase.setClient(client);
        byCase.setAddress(address);
        byCase.setContract(contract);
        byCase.setSMR(qty);
        byCase.setPrices(row);
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
        String headerValue = "attachment; filename=Case_" + numberOfCase + "_" + currentDateTime + ".pdf";
        response.setHeader(headerKey, headerValue);

        List<SMR> SMR = serviceSMR.listAll();
        ArrayList<Double> listSMRbyCase = serviceByCase.listSMRbyCase(numberOfCase);
        ArrayList<Double> listPricesByCase = serviceByCase.listPricesByCase(numberOfCase);

        PDFExporter exporter = new PDFExporter(SMR, listSMRbyCase, listPricesByCase);
        exporter.export(response, numberOfCase, client, address, total);

    }

    @GetMapping("/excelCase")
    public void exportToExcel(HttpServletResponse response, @RequestParam int numberOfCase) throws IOException {
        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        Cases byCase = this.casesRepository.findByNumberOfCase(numberOfCase).orElse(null);

        String client = byCase.getClient();
        String address = byCase.getAddress();
        double total = byCase.getTotal();

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=Case_" + numberOfCase + "_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);

        List<SMR> SMR = serviceSMR.listAll();
        ArrayList<Double> listSMRbyCase = serviceByCase.listSMRbyCase(numberOfCase);
        ArrayList<Double> listPricesByCase = serviceByCase.listPricesByCase(numberOfCase);

        ExcelExporter excelExporter = new ExcelExporter(SMR, listSMRbyCase, listPricesByCase);

        excelExporter.export(response, numberOfCase, client, address, total);
    }
}
