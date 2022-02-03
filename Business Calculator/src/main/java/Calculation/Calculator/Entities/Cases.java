package Calculation.Calculator.Entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;

import static javax.persistence.GenerationType.SEQUENCE;

@Entity
@Table(name = "Cases")
public class Cases {

    @Id
    @GeneratedValue(strategy = SEQUENCE)
    @Column(name = "Id", nullable = false)
    private int id;

    @Column(name = "NumberOfCase", nullable = false)
    private int numberOfCase;

    @Column(name = "UserName", nullable = false)
    private String userName;

    @Column(name = "Client", nullable = false)
    private String client;

    @Column(name = "Address", length = 50, nullable = false)
    private String address;

    @Column(name = "Contract", nullable = false)
    private int contract;

    @Column(name = "SMR", nullable = false)
    ArrayList<Double> SMR = new ArrayList<>();

    @Column(name = "Prices", nullable = false)
    ArrayList<Double> prices = new ArrayList<>();

    @Column(name = "Total", nullable = false)
    private double total;

    @Column(name = "date")
    private Date date;

    public Cases(int numberOfCase, String userName, String client, String address, int contract, ArrayList<Double> SMR, ArrayList<Double> prices, double total, Date date) {
        super();
        this.numberOfCase = numberOfCase;
        this.userName = userName;
        this.client = client;
        this.address = address;
        this.contract = contract;
        this.SMR = SMR;
        this.prices = prices;
        this.total = total;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumberOfCase() {
        return numberOfCase;
    }

    public void setNumberOfCase(int numberOfCase) {
        this.numberOfCase = numberOfCase;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getContract() {
        return contract;
    }

    public void setContract(int contract) {
        this.contract = contract;
    }

    public ArrayList<Double> getSMR() {
        return SMR;
    }

    public void setSMR(ArrayList<Double> SMR) {
        this.SMR = SMR;
    }

    public ArrayList<Double> getPrices() {
        return prices;
    }

    public void setPrices(ArrayList<Double> prices) {
        this.prices = prices;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Cases() {
        super();
    }


    @Override
    public String toString() {
        return String.format("Cases [ id=%s, numberOfCase=%s, userName=%s, client=%s, address=%s, contract=%s, SMR=%s, prices=%s, total=%s, date=%s",
                id, numberOfCase, userName, client, address, contract, SMR, prices, total, date);
    }

}
