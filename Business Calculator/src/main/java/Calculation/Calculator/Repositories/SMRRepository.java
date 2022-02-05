package Calculation.Calculator.Repositories;

import Calculation.Calculator.Entities.SMR;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SMRRepository extends JpaRepository<SMR, Integer> {
    List<SMR> findAll();
    Optional<SMR> findById(Integer id);
}
