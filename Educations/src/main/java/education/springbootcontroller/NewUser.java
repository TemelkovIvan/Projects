package education.springbootcontroller;

import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;

public class NewUser {

    public void newUser(String userid, String password, String email, int age) {

        try {
            FileWriter pw = new FileWriter("src/main/resources/users.txt",true);
            pw.write( "\n" + userid + " " + password + " " + email + " " + age);
            pw.close();
        } catch (FileNotFoundException ex) {
            System.out.println("The file is not find!");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
