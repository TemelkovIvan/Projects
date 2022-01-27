package Calculation.Calculator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CasesService {

    @Autowired
    CasesRepository repository;

    private static List<Cases> cases = new ArrayList<Cases>();

    public ArrayList<Integer> listSMRbyCase(int number) {
        Cases byCase = this.repository.findByNumberOfCase(number).orElse(null);
        return byCase.getSMR();
    }
}
