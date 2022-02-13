public class Simple {


    public void setName(String name) {
        this.name = name;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    private String name;
    private String lastName;
    private double salary;

    public Simple(String name, String lastName, double salary) {
        this.name = name;
        this.lastName = lastName;
        this.salary = salary;
    }

    public Simple(String n, String l, double s, double test) {
        name = n.trim();
        lastName = l.trim();
        salary = s;
    }

    public String getName() {
        return name;
    }
    public String getLastName() {
        return lastName;
    }
    public double getSalary() {
        return salary;
    }
}
