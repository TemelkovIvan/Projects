package Calculation.Calculator.Repositories;

import Calculation.Calculator.Entities.SMR;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SMRRepository extends JpaRepository<SMR, Integer> {
    List<SMR> findAll();
}
