package education.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;


@Service
public class TodoService {

    @Autowired
    TodoRepository repository;

    private static List<ToDo> todos = new ArrayList<ToDo>();

    public void addTodo(String name, String desc, Date targetDate, String linkEducation) {
        todos.add(new ToDo(name, desc, targetDate, linkEducation));

    }

    public ToDo retrieveTodos(int id) {
        List<ToDo> filteredTodos = new ArrayList<ToDo>();
        for (ToDo todo : todos) {
            if (todo.getId()==id) {
                return todo;
            }
        }
        return null;
    }

    public Date getTargeteDate(String name, String desc) {

        List<ToDo> byUserTodos = repository.findByUser(name);
        for (ToDo todo : byUserTodos ) {
            if (todo.getDesc().equals(desc)) {
                return todo.getTargetDate();
            }
        }

        return null;
    }
}
