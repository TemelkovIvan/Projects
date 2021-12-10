package education.model;

import javax.validation.constraints.Size;
import java.util.Date;


public class ToDo {
    private int id;
    private String user;

    @Size(min=5,max=10,message = "Enter atleast 5 Characters...")
    private String desc;

    private Date targetDate;
    private boolean isDone;


    public ToDo() {
        super();
    }

    public ToDo(int id, String user, String desc, Date targetDate, boolean isDone) {
        super();
        this.id = id;
        this.user = user;
        this.desc = desc;
        this.targetDate = targetDate;
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
        return String.format("ToDo [ id=%s, user=%s, targetDate=%s, isDone=%s", id, user,desc,targetDate,isDone);
    }
}
