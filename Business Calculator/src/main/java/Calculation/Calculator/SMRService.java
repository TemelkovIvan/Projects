package Calculation.Calculator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SMRService {

    @Autowired
    SMRRepository repository;

    private static List<SMR> SMR = new ArrayList<SMR>();

    public List<SMR> listAll() {
        return repository.findAll();
    }

}
