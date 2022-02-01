package Calculation.Calculator.Repositories;

import Calculation.Calculator.Entities.Cases;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CasesRepository extends JpaRepository<Cases, String> {
        List<Cases> findAll();
        Optional<Cases> findByNumberOfCase(Integer numberOfCase);
        List<Cases> findByUserName(String userName);
}

