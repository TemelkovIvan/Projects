package Calculation.Calculator;

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

    /*
    @RequestMapping(value="/add-smr",method = RequestMethod.GET)
    public ModelAndView showAddTodoPage(ModelMap model) {
        model.addAttribute("kss",new SMR(1,(String) model.get("name"),"","",1.0));
        return this.view("add-smr");
    }

    @RequestMapping(value="/add-smr",method = RequestMethod.POST)
    public ModelAndView addTodo(ModelMap model, @Valid SMR smr, BindingResult result) {
        if(result.hasErrors()){
            return this.view("add-smr");
        }

        kss.setUser((String) model.get("name"));
        repository.save(kss);
        service.addTodo((String) model.get("name"),todo.getDesc(),todo.getTargetDate(),"");


        return this.redirect("/list-smr");
    }
 */
    @RequestMapping(value="/delete-smr",method = RequestMethod.GET)
    public ModelAndView deleteTodo(@RequestParam int id) {
        repository.deleteById(id);
        return this.redirect("/list-smr");
    }

    @RequestMapping(value="/calculator",method = RequestMethod.GET)
    public ModelAndView showCalculator(ModelMap model) {
        String name = (String) model.get("name");

        model.put("smr",repository.findAll(Sort.by(Sort.Direction.ASC, "position")));
        return this.view("calculator");
    }

    @RequestMapping(value="/calculator",method = RequestMethod.POST)
    public ModelAndView addNewCase(ModelMap model,@Valid Cases newCase, @RequestParam int numberOfCase, @RequestParam String client,@RequestParam String address, @RequestParam int contract, @RequestParam int qty_1, @RequestParam int qty_2) {

        ArrayList<Integer> SMR = new ArrayList<>();

        String name = (String) model.get("name");

        newCase.setUserName(name);
        newCase.setNumberOfCase(numberOfCase);
        newCase.setClient(client);
        newCase.setAddress(address);
        newCase.setContract(contract);
        SMR.add(0,qty_1);
        SMR.add(1,qty_2);
        casesRepository.save(newCase);

        return this.view("welcome");
    }

    @RequestMapping(value="/calculator_with_existing_case",method = RequestMethod.GET)
    public ModelAndView showCalculatorWithExictingCase(ModelMap model) {
        String name = (String) model.get("name");

        model.put("smr",repository.findAll(Sort.by(Sort.Direction.ASC, "position")));

        Cases cases = this.casesRepository.findByNumberOfCase(123).orElse(null);

        if (!(cases == null)) {
            model.put("client", cases.getClient());
            model.put("address", cases.getAddress());
            model.put("numberOfCase", cases.getNumberOfCase());
            model.put("contract", cases.getContract());

            return this.view("/calculator_with_existing_case");
        }

        return this.view("welcome");
    }

}
