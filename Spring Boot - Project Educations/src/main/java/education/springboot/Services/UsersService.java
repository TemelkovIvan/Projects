package education.springboot.Services;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import education.springboot.Entities.Users;
import education.springboot.Repositories.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UsersService {

    @Autowired
    private UsersRepository repository;

    public List<Users> findAll() {
        return repository.findAll();
    }

    public Optional<Users> findByUsername(String name) {
        return repository.findByUsername(name);
    }

    public Users save(Users newUserDB) {
        return repository.save(newUserDB);
    }
}