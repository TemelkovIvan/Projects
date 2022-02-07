package education.springboot.Entities;

import javax.persistence.*;

import java.util.Date;

import static javax.persistence.GenerationType.SEQUENCE;

@Entity
@Table(name = "log")
public class Log {

    @Id
    @GeneratedValue(strategy = SEQUENCE)
    private long id;

    @Column(name = "username", nullable = false)
    private String username;

    @Column(name = "date")
    private Date date;

    public Log(String username, Date date) {
        this.username = username;
        this.date = date;
    }

    public Log() {
    }


    public long getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", date=" + date +
                '}';
    }
}
