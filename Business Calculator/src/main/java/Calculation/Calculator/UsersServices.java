package Calculation.Calculator;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UsersServices {

    @Autowired
    private UsersRepository repository;

    public List<Users> listAll() {
        return repository.findAll();
    }

}