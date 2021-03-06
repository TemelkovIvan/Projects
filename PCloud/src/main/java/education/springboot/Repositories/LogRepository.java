package education.springboot.Repositories;

import education.springboot.Entities.Log;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LogRepository extends JpaRepository<Log, Long> {
    List<Log> findAll();
    List<Log> findByUsername(String username);
}
