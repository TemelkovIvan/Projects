package education.springbootcontroller;


import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class LoginService {
    public boolean validateUser(String userid, String password) {


        String inputUser;
        String inputPass;
        boolean login = false;

        Scanner infile;

        try {
            infile = new Scanner(new File("src/main/resources/users.txt"));


            while (infile.hasNext()) {
                inputUser = infile.next();
                if (inputUser.equalsIgnoreCase(userid)) {
                    inputPass = infile.next() ;
                    if (inputPass.equalsIgnoreCase(password))
                    login = true;
                }
            }
            infile.close();
        } catch (FileNotFoundException ex) {
            System.out.println("Can't find file!");
            System.out.println(ex.getMessage());
        } catch (InputMismatchException ex) {
            System.out.println("What is this?");
        }
        return login;
    }
}



