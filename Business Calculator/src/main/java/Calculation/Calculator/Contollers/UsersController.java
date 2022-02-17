package Calculation.Calculator.Contollers;

import Calculation.Calculator.Entities.Users;
import Calculation.Calculator.Exporters.ExcelExporter;
import Calculation.Calculator.Exporters.PDFExporter;
import Calculation.Calculator.Services.EmailSenderService;
import Calculation.Calculator.Services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lowagie.text.DocumentException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
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

    @GetMapping("/")
    public ModelAndView showLogin(ModelMap model) {
        return this.redirect("/home");
    }

    @GetMapping("/login")
    public ModelAndView showLoginPage(ModelMap model, @RequestParam(required = false) String error) {

        if(error != null){
            model.put("errorMessage", "Грешно Име или Парола!");
        }

        return this.view("login");
    }

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public ModelAndView logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return this.redirect("/login");
    }

    @PostMapping(value = "/logout")
    public ModelAndView logout(ModelMap model, @RequestParam(required = false) String logout, RedirectAttributes redirectAttributes){

        if(logout != null) redirectAttributes.addFlashAttribute("logout", logout);

        return this.redirect("/login");
    }

    @GetMapping("/new-user")
    public ModelAndView newUser(ModelAndView model) {
        return this.view("new-user");
    }

    @RequestMapping(value = "/new-user", method = RequestMethod.POST)
    public ModelAndView showLoginPageWithNewUser(ModelMap model, @Valid Users newUserDB, @RequestParam String userId, @RequestParam String password, @RequestParam String confirmPassword, @RequestParam String email) {

        Users user = this.service.findByUsername(userId).orElse(null);

        if (user == null) {

            if (userId.indexOf(" ") == -1 && password.indexOf(" ") == -1 && email.indexOf(" ") == -1) {
                if (Objects.equals(password, confirmPassword)) {

                    newUserDB.setUsername(userId);
                    newUserDB.setPassword(passwordEncoder.encode(password));
                    newUserDB.setEmail(email);
                    newUserDB.setRoles("ROLE_USER");

                    service.save(newUserDB);

                    return this.view("login");

                } else {
                    model.put("errorMessage", "Грешно въведени Пароли!");
                    model.put("userId", userId);
                    model.put("email", email);
                    return this.view("new-user");
                }
            } else {
                model.put("errorMessage", "Моля въведете коректни данни и не въвеждайте интервали!");
                model.put("userId", userId);
                model.put("email", email);
                return this.view("new-user");
            }
        }
        model.put("errorMessage", "Вече има създаден потребител с такова Име!");
        model.put("userId", userId);
        model.put("email", email);
        return this.view("new-user");
    }

    @GetMapping("/home")
    public ModelAndView welcome(ModelMap model, Principal user) {
        String name = user.getName();
        model.put("name", user.getName());
        return this.view("home");
    }

    @GetMapping("/user")
    public ModelAndView user(ModelMap model) {
        String name = (String) model.get("name");

        Users user = this.service.findByUsername(name).orElse(null);

        if (user == null) {

            return this.redirect("/");

        } else {

            model.put("email",user.getEmail());

            if (!Objects.equals(user.getRoles(), "ROLE_USER")) {
                model.put("role", "Администратор");
                model.put("admin", "list-smr");
            } else {
                model.put("role", "Потребител");
            }

            return this.view("user");
        }
    }

    @GetMapping("/change")
    public ModelAndView change(ModelMap model) {
        String name = (String) model.get("name");

        Users user = this.service.findByUsername(name).orElse(null);

        if (user == null) {

            return this.redirect("/login");

        } else {

            model.put("email", user.getEmail());

            return this.view("change");
        }
    }

    @RequestMapping(value = "/change", method = RequestMethod.POST)
    public ModelAndView showChange(ModelMap model, @RequestParam String name, @RequestParam String password, @RequestParam String confirmPassword, @RequestParam String email) {
        Users user = this.service.findByUsername(name).orElse(null);

        if (password.indexOf(" ") == -1 && email.indexOf(" ") == -1) {
            if (Objects.equals(password, confirmPassword)) {

                newUserDB.setPassword(passwordEncoder.encode(password));
                user.setEmail(email);
                service.save(user);

                return this.redirect("/home");
            } else {
                model.put("errorMessage", "Грешно въведени Пароли!");
                model.put("name", name);
                model.put("email", email);

                return this.view("change");


            }
        } else {
            model.put("errorMessage", "Моля въведете коректни данни и не въвеждайте интервали!");
            model.put("name", name);
            model.put("email", email);
            return this.view("change");
        }
    }

    @GetMapping("/info")
    public ModelAndView info(ModelMap model) {
        return this.view("info");
    }

    @GetMapping("/information")
    public ModelAndView infoCreator(ModelMap model) {
        String name = (String) model.get("name");

        if (name == null) {

            return this.redirect("/");

        } else {

            return this.view("information");
        }
    }


    @GetMapping("/mail")
    public ModelAndView mail(ModelMap model) {
        String name = (String) model.get("name");

        Users user = this.service.findByUsername(name).orElse(null);

        if (user == null) {

            return this.redirect("/");

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

            return this.redirect("/calculator");
        }

        model.put("email", email);
        model.put("errorMessage", "Моля въведете текст!");

        return this.view("mail");
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/pdf")
    public void exportToPDF(HttpServletResponse response) throws DocumentException, IOException {
        response.setContentType("application/pdf");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=users_" + currentDateTime + ".pdf";
        response.setHeader(headerKey, headerValue);

        List<Users> listUsers = service.listAll();

        PDFExporter exporter = new PDFExporter(listUsers);
        exporter.export(response);

    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/excel")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=users_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);

        List<Users> listUsers = service.listAll();

        ExcelExporter excelExporter = new ExcelExporter(listUsers);

        excelExporter.export(response);
    }

    @GetMapping("/access-denied")
    public ModelAndView accessDenied(ModelMap model) {
        return this.view("access-denied");
    }
}
