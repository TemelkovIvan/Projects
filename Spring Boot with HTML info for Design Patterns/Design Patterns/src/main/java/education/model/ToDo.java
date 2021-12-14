package education.model;

import javax.validation.constraints.Size;
import java.util.Date;


public class ToDo {
    private int id;
    private String user;

    @Size(min=10,max=15,message = "Enter atleast 5 Characters...")
    private String desc;



    private String linkEducation;
    private Date targetDate;
    private boolean isDone;


    public ToDo() {
        super();
    }

    public ToDo(int id, String user, String desc, Date targetDate, String linkEducation, boolean isDone) {
        super();
        this.id = id;
        this.user = user;
        this.desc = desc;
        this.targetDate = targetDate;
        this.linkEducation = linkEducation;
        this.isDone = isDone;
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

    public boolean isDone() {
        return isDone;
    }

    public void setDone(boolean done) {
        isDone = done;
    }

    @Override
    public String toString() {
        return String.format("ToDo [ id=%s, user=%s, desc=%s, targetDate=%s, link=%s, isDone=%s", id, user,desc,targetDate,linkEducation,isDone);
    }
}
