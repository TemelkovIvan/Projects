package education.springboot;

import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;


@Service
public class TodoService {

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
}
