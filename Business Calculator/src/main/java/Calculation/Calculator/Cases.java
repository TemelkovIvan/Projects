package Calculation.Calculator;

import javax.persistence.*;
import java.util.ArrayList;

import static javax.persistence.GenerationType.SEQUENCE;

@Entity
@Table(name = "Cases")
public class Cases {

    @Id
    @GeneratedValue(strategy = SEQUENCE)
    @Column(name = "id", nullable = false)
    private int id;

    @Column(name = "numberOfCase", nullable = false)
    private int numberOfCase;

    @Column(name = "userName", nullable = false)
    private String userName;

    @Column(name = "client", nullable = false)
    private String client;

    @Column(name = "address", length = 50, nullable = false)
    private String address;

    @Column(name = "contract", nullable = false)
    private int contract;

    @Column(name = "SMR", nullable = false)
    ArrayList<Integer> SMR = new ArrayList<>();

    public Cases(int numberOfCase, String userName, String client, String address, int contract, ArrayList<Integer> SMR) {
        super();
        this.numberOfCase = numberOfCase;
        this.userName = userName;
        this.client = client;
        this.address = address;
        this.contract = contract;
        this.SMR = SMR;
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

    public ArrayList<Integer> getSMR() {
        return SMR;
    }

    public void setSMR(ArrayList<Integer> SMR) {
        this.SMR = SMR;
    }

    public Cases() {
        super();
    }


    @Override
    public String toString() {
        return String.format("Cases [ id=%s, numberOfCase=%s, userName=%s, client=%s, address=%s, contract=%s, SMR=%s",
                id, numberOfCase, userName, client, address, contract, SMR);
    }

}
