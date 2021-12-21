package education.springbootcontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;

public class UserRepositoryCommandLineRunner implements CommandLineRunner {

    private static final Logger log = LoggerFactory.getLogger(UserRepositoryCommandLineRunner.class);

    private UsersRepository userRepository;

    public void run(String... arg0) throws Exception {
        Users user = new Users("Georgi", "1234", "georgi@test.test", 0);
        userRepository.save(user);
        log.info("New User is created :" + user);
        System.out.println("New User is created :" + user);
    }
}
