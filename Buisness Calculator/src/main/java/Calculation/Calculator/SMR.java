package Calculation.Calculator;

import javax.persistence.*;

import static javax.persistence.GenerationType.SEQUENCE;

@Entity
@Table(name = "SMR")
public class SMR {

    @Id
    @GeneratedValue(strategy = SEQUENCE)
    @Column(name = "id", nullable = false)
    private int id;

    @Column(name = "position", nullable = false)
    private int position;

    @Column(name = "action", nullable = false)
    private String action;

    @Column(name = "descr")
    private String descr;

    @Column(name = "type")
    private String type;

    @Column(name = "price_contract_1")
    private double price_contract_1;

    @Column(name = "price_contract_2")
    private double price_contract_2;

    @Column(name = "price_contract_3")
    private double price_contract_3;

    @Column(name = "price_contract_4")
    private double price_contract_4;

    @Column(name = "price_contract_5")
    private double price_contract_5;

    public SMR() {
        super();
    }

    public SMR(int position, String action, String descr, String type, double price_contract_1, double price_contract_2, double price_contract_3, double price_contract_4, double price_contract_5) {
        super();
        this.position = position;
        this.action = action;
        this.descr = descr;
        this.type = type;
        this.price_contract_1 = price_contract_1;
        this.price_contract_2 = price_contract_2;
        this.price_contract_3 = price_contract_3;
        this.price_contract_4 = price_contract_4;
        this.price_contract_5 = price_contract_5;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getPrice_contract_1() {
        return price_contract_1;
    }

    public void setPrice_contract_1(double price_contract_1) {
        this.price_contract_1 = price_contract_1;
    }

    public double getPrice_contract_2() {
        return price_contract_2;
    }

    public void setPrice_contract_2(double price_contract_2) {
        this.price_contract_2 = price_contract_2;
    }

    public double getPrice_contract_3() {
        return price_contract_3;
    }

    public void setPrice_contract_3(double price_contract_3) {
        this.price_contract_3 = price_contract_3;
    }

    public double getPrice_contract_4() {
        return price_contract_4;
    }

    public void setPrice_contract_4(double price_contract_4) {
        this.price_contract_4 = price_contract_4;
    }

    public double getPrice_contract_5() {
        return price_contract_5;
    }

    public void setPrice_contract_5(double price_contract_5) {
        this.price_contract_5 = price_contract_5;
    }


    @Override
    public String toString() {
        return "SMR{" +
                "id=" + id +
                ", position=" + position +
                ", action='" + action + '\'' +
                ", descr='" + descr + '\'' +
                ", type='" + type + '\'' +
                ", price_contract_1=" + price_contract_1 +
                ", price_contract_2=" + price_contract_2 +
                ", price_contract_3=" + price_contract_3 +
                ", price_contract_4=" + price_contract_4 +
                ", price_contract_5=" + price_contract_5 +
                '}';
    }

}
