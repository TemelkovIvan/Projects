package education.springbootcontroller;

import org.springframework.stereotype.Service;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.io.FileNotFoundException;

@Service
public class TodoService {
    private static List<ToDo> todos = new ArrayList<ToDo>();
    /*
    private static int todoCount = 7;

    static {
        todos.add(new ToDo("IvanT", "Learn HTML", new Date(),"html"));
        todos.add(new ToDo( "IvanT", "Learn CSS", new Date(),"css"));
        todos.add(new ToDo( "IvanT", "Learn Design Pattern", new Date(),"design-patterns"));
        todos.add(new ToDo("IvanT", "Learn Spring MVC", new Date(),"spring-mvc"));
        todos.add(new ToDo("Georgi", "Learn Design Pattern", new Date(),"design-patterns"));
        todos.add(new ToDo("Georgi", "Learn HTML", new Date(),"html"));
        todos.add(new ToDo( "Georgi", "Learn CSS", new Date(),"css"));

        try {
            FileWriter pw = new FileWriter("output.txt",true);
                for(ToDo one : todos) {
                   pw.write(String.valueOf(one)+ "\n");
                }
            pw.close();
        } catch (FileNotFoundException ex) {
            System.out.println("The file is not find!");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

*/
    public List<ToDo> retrieveTodos(String user) {
        List<ToDo> filteredTodos = new ArrayList<ToDo>();
        for (ToDo todo : todos) {
            if (todo.getUser().equals(user)) {
                filteredTodos.add(todo);
            }
        }
        return filteredTodos;
    }

    public void addTodo(String name, String desc, Date targetDate, String linkEducation) {
        todos.add(new ToDo(name, desc, targetDate, linkEducation));
        try {
            FileWriter pw = new FileWriter("output.txt",true);
                pw.write(String.valueOf(todos.get(todos.size()-1))+ "\n");
                pw.close();
        } catch (FileNotFoundException ex) {
            System.out.println("The file is not find!");
        } catch (IOException e) {
            e.printStackTrace();
        }
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