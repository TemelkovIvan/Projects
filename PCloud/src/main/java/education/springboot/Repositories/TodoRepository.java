package education.springboot.Repositories;

import education.springboot.Entities.ToDo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TodoRepository extends JpaRepository<ToDo, Integer> {
    List<ToDo> findByUser(String user);
}
