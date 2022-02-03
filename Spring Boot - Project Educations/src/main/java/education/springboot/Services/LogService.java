package education.springboot.Services;

import education.springboot.Entities.Log;
import education.springboot.Repositories.LogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogService {

    @Autowired
    private LogRepository repository;

    public List<Log> findAll() {
        return repository.findAll();
    }

    public List<Log> findByUsername(String name) {
        return repository.findByUsername(name);
    }

    public Log save(Log newLog) {
        return repository.save(newLog);
    }
}
