package education.springboot.Controllers;

import education.springboot.Entities.Log;
import education.springboot.Services.EmailSenderService;
import education.springboot.Entities.Users;
import education.springboot.Services.LogService;
import education.springboot.Services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Date;
import java.util.Objects;

@Controller
@SessionAttributes("name")
public class UsersController extends BaseController {

    @Autowired
    private EmailSenderService serviceEmail;

    @Autowired
    private UsersService service;

    Users newUserDB = new Users();

    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Autowired
    private LogService logService;

    Log newlog = new Log();

    Date date = new Date(System.currentTimeMillis());

    @GetMapping("/")
    public ModelAndView showLogin(ModelMap model) {
        return this.redirect("/list-educations");
    }

    @GetMapping("/login")
    public ModelAndView showLoginPage(ModelMap model, @RequestParam(required = false) String error) {

        if(error != null){
            model.put("errorMessage", "Грешно Име или Парола!");
        }


        return this.view("login");
    }

    /* OLD version without Spring Security
    @RequestMapping(value = "/learn", method = RequestMethod.POST)
    public ModelAndView showWelcomePage(ModelMap model, @Valid Log newLog, @RequestParam String name, @RequestParam String password) {

        Users user = this.service.findByUsername(name).orElse(null);

        if (!(user == null)) {

            newLog.setUsername(name);
            newLog.setDate(new Date(System.currentTimeMillis()));
            logService.save(newLog);

            model.put("name", name);
            return this.view("welcome");
        }

        model.put("errorMessage", "Грешно Име или Парола!");
        return this.view("login");
    }
     */

    @GetMapping("/new-user")
    public ModelAndView newUser(ModelAndView model) {
        return this.view("new-user");
    }

    @RequestMapping(value = "/new-user", method = RequestMethod.POST)
    public ModelAndView showLoginPageWithNewUser(ModelMap model, @Valid Users newUserDB, @RequestParam String userName, @RequestParam String password, @RequestParam String confirmPassword, @RequestParam String email, @RequestParam int age) {

        Users user = this.service.findByUsername(userName).orElse(null);

        if (user == null) {

            if (userName.indexOf(" ") == -1 && password.indexOf(" ") == -1 && email.indexOf(" ") == -1) {
                if (Objects.equals(password, confirmPassword)) {

                    newUserDB.setUsername(userName);
                    newUserDB.setPassword(passwordEncoder.encode(password));
                    newUserDB.setEmail(email);
                    newUserDB.setAge(age);
                    newUserDB.setDate(date);
                    newUserDB.setRoles("ROLE_USER");

                    serviceEmail.sendSimpleEmail(email, "Успешна регистрация!",
                            "Здравейте!\n\n" +
                                    "Успешно се регистрирахте в сайтът за обучение!\n" +
                                    "Вашето потребителско име е: " + userName +
                                    "\n\n\nБлагодарим!");

                    service.save(newUserDB);

                    return this.view("login");
                } else {
                    model.put("errorMessage", "Грешно въведени Пароли!");
                    model.put("userId", userName);
                    model.put("email", email);
                    model.put("age", age);
                    return this.view("new-user");
                }
            } else {
                model.put("errorMessage", "Моля въведете коректни данни и не въвеждайте интервали!");
                model.put("userId", userName);
                model.put("email", email);
                model.put("age", age);
                return this.view("new-user");
            }
        }
        model.put("errorMessage", "Вече има създаден потребител с такова Име!");
        model.put("userId", userName);
        model.put("email", email);
        model.put("age", age);
        return this.view("new-user");
    }

    @GetMapping("/change")
    public ModelAndView change(ModelMap model) {
        String name = (String) model.get("name");

        Users user = this.service.findByUsername(name).orElse(null);

        if (user == null) {

            return this.redirect("/login");

        } else {

            model.put("email", user.getEmail());
            model.put("age", user.getAge());

            return this.view("change");
        }
    }

    @RequestMapping(value = "/change", method = RequestMethod.POST)
    public ModelAndView showChange(ModelMap model, @RequestParam String name, @RequestParam String password, @RequestParam String confirmPassword, @RequestParam String email, @RequestParam int age) {
        Users user = this.service.findByUsername(name).orElse(null);

        if (password.indexOf(" ") == -1 && email.indexOf(" ") == -1) {
            if (Objects.equals(password, confirmPassword)) {

                user.setPassword(DigestUtils.sha256Hex(password));
                user.setEmail(email);
                user.setAge(age);
                service.save(user);

                return this.redirect("/learn");
            } else {
                model.put("errorMessage", "Грешно въведени Пароли!");
                model.put("name", name);
                model.put("email", email);
                model.put("age", age);

                return this.view("change");


            }
        } else {
            model.put("errorMessage", "Моля въведете коректни данни и не въвеждайте интервали!");
            model.put("name", name);
            model.put("email", email);
            model.put("age", age);
            return this.view("change");
        }
    }

    @GetMapping("/mail")
    public ModelAndView mail(ModelMap model) {
        String name = (String) model.get("name");

        Users user = this.service.findByUsername(name).orElse(null);

        if (user == null) {

            return this.redirect("/learn");

        } else {

            model.put("email", user.getEmail());

            return this.view("mail");
        }
    }

    @RequestMapping(value = "/mail", method = RequestMethod.POST)
    public ModelAndView mail(ModelMap model, @RequestParam String email, @RequestParam String textarea) {

        if (!textarea.equals("")) {
            serviceEmail.sendSimpleEmail("noreply.sprboot@gmail.com", "Изпратено съобщение от "+ email,
                    "Съобщението е: "+ textarea + "\nEmail: " + email);

            return this.redirect("/list-educations");
        }

        model.put("email", email);
        model.put("errorMessage", "Моля въведете текст!");

        return this.view("mail");
    }
}

