package Calculation.Calculator;

import com.lowagie.text.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;


@Controller
@SessionAttributes("name")
public class KSSController extends BaseController {

    @Autowired
    CasesService service = new CasesService();

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
                                    @RequestParam int qty_1, @RequestParam int qty_2, @RequestParam int qty_3, @RequestParam int qty_4) {

        ArrayList<Integer> SMR = new ArrayList<>();

        String name = (String) model.get("name");

        newCase.setUserName(name);
        newCase.setNumberOfCase(numberOfCase);
        newCase.setClient(client);
        newCase.setAddress(address);
        newCase.setContract(contract);
        SMR.add(qty_1);
        SMR.add(qty_2);
        SMR.add(qty_3);
        SMR.add(qty_4);
        newCase.setSMR(SMR);
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

            return this.view("calculator_change");
        }

        model.put("errorMessage", "Не се намират подадените данни");
        return this.view("search");
    }

    @RequestMapping(value="/calculator_change",method = RequestMethod.POST)
        public ModelAndView showCalcWithExistingCase(ModelMap model, @RequestParam int numberOfCase, @RequestParam String client,@RequestParam String address, @RequestParam int contract,
                                                     @RequestParam int qty_1, @RequestParam int qty_2, @RequestParam int qty_3, @RequestParam int qty_4) {

        Cases byCase = this.casesRepository.findByNumberOfCase(numberOfCase).orElse(null);

        ArrayList<Integer> SMR = new ArrayList<>();
        byCase.setUserName((String) model.get("name"));
        byCase.setClient(client);
        byCase.setAddress(address);
        byCase.setContract(contract);
        SMR.add(0, qty_1);
        SMR.add(1, qty_2);
        SMR.add(2, qty_3);
        SMR.add(3, qty_4);
        byCase.setSMR(SMR);
        casesRepository.save(byCase);

        return this.redirect("/home");
    }
}
