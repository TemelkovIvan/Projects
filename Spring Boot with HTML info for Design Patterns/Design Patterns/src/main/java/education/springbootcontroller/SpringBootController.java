package education.springbootcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


@Controller
@SessionAttributes("name")
public class SpringBootController {

    LoginService service = new LoginService();

    @RequestMapping(value="/learn",method = RequestMethod.GET)
    public String showLoginPage(ModelMap model) {
        return "login";
    }

    @RequestMapping(value="/learn",method = RequestMethod.POST)
    public String showWelcomePage(ModelMap model, @RequestParam String name, @RequestParam String password) {
        boolean isValidUser = service.validateUser(name,password);

        if (!isValidUser) {
            model.put("errorMessage", "invalid Credentials");
            return "login";
        }

        model.put("name", name);
        model.put("password", password);
        return "welcome";
    }
}
