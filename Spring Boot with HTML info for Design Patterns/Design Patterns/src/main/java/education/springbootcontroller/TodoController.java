package education.springbootcontroller;

import education.model.TodoService;
import education.model.ToDo;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.io.File;
import java.io.FileNotFoundException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.InputMismatchException;
import java.util.Scanner;

@Controller
@SessionAttributes("name")
public class TodoController extends BaseController {

    TodoService service = new TodoService();

    @InitBinder
    public void initBinder(WebDataBinder binder){
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }


    @RequestMapping(value="/list-educations",method = RequestMethod.GET)
    public ModelAndView showTodo(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.retrieveTodos(name));
        return this.view("list-educations");
    }

    @RequestMapping(value="/add-education",method = RequestMethod.GET)
    public ModelAndView showAddTodoPage(ModelMap model) {
        model.addAttribute("todo",new ToDo(0,(String) model.get("name"),"Default",new Date(),""));
        return this.view("add-education");
    }

    @RequestMapping(value="/delete-education",method = RequestMethod.GET)
    public ModelAndView deleteTodo(@RequestParam int id) {
        service.deleteTodo(id);
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
        deleteTodo(todo.getId());
        service.updateTodo(todo);
        return this.redirect("/list-educations");
    }

    @RequestMapping(value="/add-education",method = RequestMethod.POST)
    public ModelAndView addTodo(ModelMap model, @Valid ToDo todo, BindingResult result) {
        if(result.hasErrors()){
            return this.view("add-education");
        }
        service.addTodo((String) model.get("name"),todo.getDesc(),todo.getTargetDate(),"");
        return this.redirect("/list-educations");
    }


    @RequestMapping(value="/design-patterns",method = RequestMethod.GET)
    public ModelAndView degingPattern(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.retrieveTodos(name));
        return this.view("design-patterns");
    }

    @GetMapping("/html")
    public ModelAndView html(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.retrieveTodos(name));
        return this.view("html");
    }

    @GetMapping("/css")
    public ModelAndView css(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.retrieveTodos(name));
        return this.view("css");
    }

    @GetMapping("/spring-mvc")
    public ModelAndView springmvc(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.retrieveTodos(name));
        return this.view("spring-mvc");
    }

    @GetMapping("/info")
    public ModelAndView info(ModelMap model) {
        return this.view("info");
    }

    @GetMapping("/information")
    public ModelAndView infoCreator(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.retrieveTodos(name));
        return this.view("information");
    }

    @GetMapping("/user")
    public ModelAndView user(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.retrieveTodos(name));

        Scanner infile;
        String inputUser;
        String email=null;
        int age=0;
        
        try {
            infile = new Scanner(new File("src/main/resources/users.txt"));
            while (infile.hasNext()) {
                inputUser = infile.next();
                
                if(inputUser.equalsIgnoreCase(name)) {
                  email=infile.next();
                    email=infile.next();
                    age= infile.nextInt();
                }
            }
            infile.close();
        } catch (FileNotFoundException ex) {
            System.out.println("Can't find file!");
            System.out.println(ex.getMessage());
        } catch (InputMismatchException ex) {
            System.out.println("What is this?");
        }
        model.put("email",email);
        model.put("age", age);
        return this.view("user");
        }
    }
