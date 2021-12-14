package education.springbootcontroller;

import education.model.TodoService;
import education.model.ToDo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@SessionAttributes("name")
public class TodoController {

    TodoService service = new TodoService();

    @InitBinder
    public void initBinder(WebDataBinder binder){
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }


    @RequestMapping(value="/list-todos",method = RequestMethod.GET)
    public String showTodo(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.retrieveTodos(name));
        return "list-todos";
    }

    @RequestMapping(value="/add-todo",method = RequestMethod.GET)
    public String showAddTodoPage(ModelMap model) {
        model.addAttribute("todo",new ToDo(0,(String) model.get("name"),"Default",new Date(),false));
        return "add-todo";
    }

    @RequestMapping(value="/delete-todo",method = RequestMethod.GET)
    public String deleteTodo(@RequestParam int id) {
        service.deleteTodo(id);
        return "redirect:/list-todos";
    }

    @RequestMapping(value="/update-todo",method = RequestMethod.GET)
    public String showUpdateTodo(@RequestParam int id,ModelMap model) {
        ToDo todo = service.retrieveTodos(id);
        model.put("todo",todo);
        return "add-todo";
    }

    @RequestMapping(value="/update-todo",method = RequestMethod.POST)
    public String updateTodo(ModelMap model, @Valid ToDo todo, BindingResult result) {

        if(result.hasErrors()){
            return "add-todo";
        }
        todo.setUser((String) model.get("name"));
        deleteTodo(todo.getId());
        service.updateTodo(todo);
        return "redirect:/list-todos";
    }

    @RequestMapping(value="/add-todo",method = RequestMethod.POST)
    public String addTodo(ModelMap model, @Valid ToDo todo, BindingResult result) {
        if(result.hasErrors()){
            return "add-todo";
        }
        service.addTodo((String) model.get("name"),todo.getDesc(),todo.getTargetDate(),false);
        return "redirect:/list-todos";
    }


    @RequestMapping(value="/design-patterns",method = RequestMethod.GET)
    public String degingPattern(ModelMap model) {
        String name = (String) model.get("name");
        model.put("todos",service.retrieveTodos(name));
        return "design-patterns";
    }
}
