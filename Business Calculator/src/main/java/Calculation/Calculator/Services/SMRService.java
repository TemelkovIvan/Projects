package Calculation.Calculator.Services;

import Calculation.Calculator.Entities.SMR;
import Calculation.Calculator.Repositories.SMRRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SMRService {

    @Autowired
    SMRRepository repository;

    private static List<Calculation.Calculator.Entities.SMR> SMR = new ArrayList<SMR>();

    public List<SMR> listAll() {
        return repository.findAll();
    }

    public List<SMR> findAll(Sort position) {
        return repository.findAll();
    }
}
