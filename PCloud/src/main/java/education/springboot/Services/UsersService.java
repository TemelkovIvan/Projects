package education.springboot.Services;

import java.util.*;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import education.springboot.Entities.Users;
import education.springboot.Repositories.UsersRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UsersService implements UserDetailsService{

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

        List<GrantedAuthority> authorities = Arrays.stream(users.getRoles().split(","))
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());

        if (users == null) {
            throw new UsernameNotFoundException("Няма такъв потребител!");
        }

        UserDetails userDetails = new User(users.getUsername(), users.getPassword(), authorities);

        return userDetails;
    }
}