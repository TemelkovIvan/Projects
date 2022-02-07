package education.springboot.Services;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import education.springboot.Entities.Users;
import education.springboot.Repositories.UsersRepository;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UsersService implements UserDetailsService {

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


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Users users = this.repository.findByUsername(username).orElse(null);

        if (users == null) {
            throw new UsernameNotFoundException("Няма такъв потребител!");
        }

        UserDetails userDetails = new org.springframework.security.core.userdetails.User(users.getUsername(), users.getPassword(), new HashSet<>());

        return userDetails;
    }
}