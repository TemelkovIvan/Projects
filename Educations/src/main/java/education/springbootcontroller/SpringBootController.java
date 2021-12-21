package education.springbootcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Objects;


@Controller
@SessionAttributes("name")
public class SpringBootController extends BaseController {

    @Autowired
    UsersRepository repository;

    LoginService service = new LoginService();
    NewUser newUser = new NewUser();
    Users newUserDB = new Users();

    @GetMapping("/learn")
    public ModelAndView showLoginPage(ModelMap model) {
        return this.view("login");
    }

    @RequestMapping(value = "/learn", method = RequestMethod.POST)
    public ModelAndView showWelcomePage(ModelMap model, @RequestParam String name, @RequestParam String password) {

        //repository.findByUsername(name);
        System.out.println(repository.findByUsername(name));

        boolean isValidUser = service.validateUser(name, password);

        if (!isValidUser) {
            model.put("errorMessage", "Грешно Име или Парола!");
            return this.view("login");
        }

        model.put("name", name);
        model.put("password", password);
        return this.view("welcome");
    }

    @GetMapping("/new-user")
    public ModelAndView newUser(ModelAndView model) {
        return this.view("new-user");
    }

    @RequestMapping(value = "/new-user", method = RequestMethod.POST)
    public ModelAndView showLoginPageWithNewUser(ModelMap model, @RequestParam String userId, @RequestParam String password, @RequestParam String confirmPassword, @RequestParam String email, @RequestParam int age) {
        if (userId.indexOf(" ") == -1 && password.indexOf(" ") == -1 && email.indexOf(" ") == -1) {
            if (Objects.equals(password, confirmPassword)) {

                newUserDB.setUsername(userId);
                newUserDB.setPassword(DigestUtils.sha256Hex(password));
                newUserDB.setEmail(email);
                newUserDB.setAge(age);
                repository.save(newUserDB);

                newUser.newUser(userId, password, email, age);
                model.put("name", userId);
                model.put("password", password);
                model.put("email", email);
                model.put("age", age);
                return this.view("welcome");
            } else {
                model.put("errorMessage", "Грешно въведени Пароли!");
                model.put("userId", userId);
                model.put("email", email);
                model.put("age", age);
                return this.view("new-user");
            }
        } else {
            model.put("errorMessage", "Моля въведете коректни данни и не въвеждайте интервали!");
            model.put("userId", userId);
            model.put("email", email);
            model.put("age", age);
            return this.view("new-user");
        }
    }
}
