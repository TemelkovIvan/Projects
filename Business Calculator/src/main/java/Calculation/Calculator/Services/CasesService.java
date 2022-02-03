package Calculation.Calculator.Services;

import Calculation.Calculator.Entities.Cases;
import Calculation.Calculator.Repositories.CasesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CasesService {

    @Autowired
    private CasesRepository repository;

    private static List<Cases> cases = new ArrayList<Cases>();

    public ArrayList<Double> listSMRbyCase(int number) {
        Cases byCase = this.repository.findByNumberOfCase(number).orElse(null);
        return byCase.getSMR();
    }

    public ArrayList<Double> listPricesByCase(int number) {
        Cases byCase = this.repository.findByNumberOfCase(number).orElse(null);
        return byCase.getPrices();
    }

    public Optional<Cases> findByNumberOfCase(int numberOfCase) {
        return repository.findByNumberOfCase(numberOfCase);
    }

    public List<Cases> findByUserName(String name) {
        return repository.findByUserName(name);
    }

    public Cases save(Cases enterCase) {
        return repository.save(enterCase);
    }
}
