package education.springbootcontroller;

public class LoginService {
    public boolean validateUser(String userid, String password) {
        return (userid.equalsIgnoreCase("test")
                && password.equalsIgnoreCase("123"));
    }
}
