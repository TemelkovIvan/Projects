package education.springbootcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


@Controller
@SessionAttributes("name")
public class SpringBootController {

    LoginService service = new LoginService();
    NewUser newUser = new NewUser();

    @GetMapping("/learn")
    public String showLoginPage(ModelMap model) {
        return "login";
    }

    @RequestMapping(value="/learn",method = RequestMethod.POST)
    public String showWelcomePage(ModelMap model, @RequestParam String name, @RequestParam String password) {
        boolean isValidUser = service.validateUser(name,password);

        if (!isValidUser) {
            model.put("errorMessage", "Грешно Име или Парола!");
            return "login";
        }

        model.put("name", name);
        model.put("password", password);
        return "welcome";
    }

    @GetMapping("/new-user")
    public String newUser(ModelMap model) {
        return "new-user";
    }

    @RequestMapping(value="/new-user",method = RequestMethod.POST)
    public String showLoginPageWithNewUser(ModelMap model, @RequestParam String userId, @RequestParam String password) {
        newUser.newUser(userId,password);
        model.put("name", userId);
        model.put("password", password);
        return "welcome";
    }

}
