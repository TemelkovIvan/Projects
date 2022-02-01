package Calculation.Calculator.Services;

import java.util.List;

import javax.transaction.Transactional;

import Calculation.Calculator.Entities.Users;
import Calculation.Calculator.Repositories.UsersRepository;
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