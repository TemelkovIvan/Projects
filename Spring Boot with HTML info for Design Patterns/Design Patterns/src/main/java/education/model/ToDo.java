package education.model;

import javax.validation.constraints.Size;
import java.util.Date;


public class ToDo {
    private int id;
    private String user;

    @Size(min=10,max=15,message = "Enter atleast 10 Characters...")
    private String desc;

    private String linkEducation;
    private Date targetDate;



    public ToDo() {
        super();
    }

    public ToDo(int id, String user, String desc, Date targetDate, String linkEducation) {
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