package Calculation.Calculator.Services;

import Calculation.Calculator.Entities.SMR;
import Calculation.Calculator.Repositories.SMRRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class SMRService {

    @Autowired
    SMRRepository repository;

    private static List<SMR> SMR = new ArrayList<SMR>();

    public List<SMR> listAll() {
        return repository.findAll();
    }

    public List<SMR> findAll(Sort position) {
        return repository.findAll();
    }

    public SMR retrieveSMR(int id) {
        SMR smr = this.repository.findById(id).orElse(null);
        return smr;
    }


    public void deleteById(int id) {
        repository.deleteById(id);
    }

    public void save(SMR smr) {
        repository.save(smr);
    }
}
