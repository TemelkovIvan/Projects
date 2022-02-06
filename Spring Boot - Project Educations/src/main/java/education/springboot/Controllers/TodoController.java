package education.springboot.Controllers;

import education.springboot.Entities.ToDo;
import education.springboot.Entities.Users;
import education.springboot.Services.LogService;
import education.springboot.Services.TodoService;
import education.springboot.Services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Date;
import java.text.SimpleDateFormat;

//@PreAuthorize("isAuthenticated()")
@Controller
@SessionAttributes("name")
public class TodoController extends BaseController {

    @Autowired
    TodoService service = new TodoService();

    @Autowired
    private UsersService usersService;

    @Autowired
    private LogService logService;

    @InitBinder
    public void initBinder(WebDataBinder binder){
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }

    @RequestMapping(value="/list-educations",method = RequestMethod.GET)
    public ModelAndView showTodo(ModelMap model) {
        String name = (String) model.get("name");
        
        model.put("todos",service.findByUser(name));
        return this.view("list-educations");
    }

    @RequestMapping(value="/add-education",method = RequestMethod.GET)
    public ModelAndView showAddTodoPage(ModelMap model) {
        model.addAttribute("todo",new ToDo((String) model.get("name"),"Default",new Date(),""));
        return this.view("add-education");
    }

    @RequestMapping(value="/delete-education",method = RequestMethod.GET)
    public ModelAndView deleteTodo(@RequestParam int id) {
        service.deleteById(id);
        return this.redirect("/list-educations");
    }

    @RequestMapping(value="/update-education",method = RequestMethod.GET)
    public ModelAndView showUpdateTodo(@RequestParam int id,ModelMap model) {
        ToDo todo = service.retrieveTodos(id);
        model.put("todo",todo);
        return this.view("add-education");
    }

    @RequestMapping(value="/update-education",method = RequestMethod.POST)
    public ModelAndView updateTodo(ModelMap model, @Valid ToDo todo, BindingResult result) {

        if(result.hasErrors()){
            return this.view("add-education");
        }
        todo.setUser((String) model.get("name"));
        service.save(todo);
        return this.redirect("/list-educations");
    }

    @RequestMapping(value="/add-education",method = RequestMethod.POST)
    public ModelAndView addTodo(ModelMap model, @Valid ToDo todo, BindingResult result) {
        if(result.hasErrors()){
            return this.view("add-education");
        }

        todo.setUser((String) model.get("name"));
        service.save(todo);
        service.addTodo((String) model.get("name"),todo.getDesc(),todo.getTargetDate(),"");
        return this.redirect("/list-educations");
    }


    @RequestMapping(value="/design-patterns",method = RequestMethod.GET)
    public ModelAndView designPattern(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.findByUser(name));
        model.put("targetDate",service.getTargeteDate(name,"LEARN DESIGN PATTERN"));
        return this.view("design-patterns");
    }

    @GetMapping("/html")
    public ModelAndView html(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.findByUser(name));
        model.put("targetDate",service.getTargeteDate(name,"LEARN HTML"));
        return this.view("html");
    }

    @GetMapping("/css")
    public ModelAndView css(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.findByUser(name));
        model.put("targetDate",service.getTargeteDate(name,"Learn CSS"));
        return this.view("css");
    }

    @GetMapping("/spring-mvc")
    public ModelAndView springmvc(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.findByUser(name));
        model.put("targetDate",service.getTargeteDate(name,"LEARN SPRING MVC"));
        return this.view("spring-mvc");
    }

    @GetMapping("/jquery")
    public ModelAndView jquery(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.findByUser(name));
        model.put("targetDate",service.getTargeteDate(name,"Learn JQuery"));

        return this.view("jquery");
    }


    @GetMapping("/info")
    public ModelAndView info(ModelMap model) {
        return this.view("info");
    }

    @GetMapping("/information")
    public ModelAndView infoCreator(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.findByUser(name));

        if (name == null) {

            return this.redirect("/learn");

        } else {

            return this.view("information");
        }
    }

    @GetMapping("/log")
    public ModelAndView log(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.findByUser(name));

        if (name == null) {

            return this.redirect("/learn");

        } else {

            if (name.equals("IvanT")) {
                model.put("users", usersService.findAll());
                model.put("log", logService.findAll());
                return this.view("log");
            } else {
                return this.view("list-educations");
            }
        }
    }


    @PostMapping("/log")
    public ModelAndView logSearchByUser(ModelMap model, @RequestParam String userId) {
        String name = (String) model.get("name");
        model.put("todos",service.findByUser(name));
        model.put("users",usersService.findAll());
        model.put("log",logService.findByUsername(userId));
        return this.view("log");
    }


    @GetMapping("/user")
    public ModelAndView user(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.findByUser(name));

        Users user = this.usersService.findByUsername(name).orElse(null);

        if (user == null) {

            return this.redirect("/learn");

        } else {

        model.put("email",user.getEmail());
        model.put("age", user.getAge());
        model.put("date", user.getDate());
        return this.view("user");
        }
    }

}

