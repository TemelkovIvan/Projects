package education.model;

import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class TodoService {
    private static List<ToDo> todos = new ArrayList<ToDo>();
    private static int todoCount = 4;

    static {
        todos.add(new ToDo(1, "test", "Learn Spring MVC", new Date(), false));
        todos.add(new ToDo(2, "test", "Learn Struts", new Date(), false));
        todos.add(new ToDo(3, "test", "Learn Hibernate", new Date(), false));
        todos.add(new ToDo(4, "test", "test", new Date(), false));
    }
    public List<ToDo> retrieveTodos(String user) {
        List<ToDo> filteredTodos = new ArrayList<ToDo>();
        for (ToDo todo : todos) {
            if (todo.getUser().equals(user)) {
                filteredTodos.add(todo);
            }
        }
        return filteredTodos;
    }

    public void addTodo(String name, String desc, Date targetDate, boolean isDone) {
        todos.add(new ToDo(++todoCount, name, desc, targetDate, isDone));
    }

    public void deleteTodo(int id) {
        Iterator<ToDo> iterator = todos.iterator();
        while (iterator.hasNext()) {
            ToDo todo = iterator.next();
            if (todo.getId() == id) {
                iterator.remove();
            }
        }
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

    public void updateTodo(ToDo todo){
        todos.add(todo);
    }

}
