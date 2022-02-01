package education.springboot.Entities;

import javax.persistence.*;
import java.util.Date;

import static javax.persistence.GenerationType.SEQUENCE;

@Entity
@Table(name = "todo")
public class ToDo {

    @Id
    @GeneratedValue(strategy = SEQUENCE)
    @Column(name = "id", nullable = false)
    private int id;

    @Column(name = "username", nullable = false, updatable = false)
    private String user;

    @Column(name = "descc")
    private String desc;

    @Column(name = "link")
    private String linkEducation;

    @Column(name = "targetdate")
    private Date targetDate;


    public ToDo() {
        super();
    }

    public ToDo(String user, String desc, Date targetDate, String linkEducation) {
        super();
        this.id = id;
        this.user = user;
        this.desc = desc;
        this.targetDate = targetDate;
        this.linkEducation = linkEducation;

    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }


    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }


    public Date getTargetDate() {
        return targetDate;
    }


    public String getLinkEducation() {
        return linkEducation;
    }

    public void setLinkEducation(String linkEducation) {
        this.linkEducation = linkEducation;
    }

    public void setTargetDate(Date targetDate) {
        this.targetDate = targetDate;
    }

    @Override
    public String toString() {
        return String.format("ToDo [ id=%s, user=%s, desc=%s, targetDate=%s, link=%s", id, user,desc,targetDate,linkEducation);
    }
}
