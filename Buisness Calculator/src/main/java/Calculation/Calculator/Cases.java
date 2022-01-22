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

    @Column(name = "contract", nullable = false)
    private int contract;

    @Column(name = "SMR", nullable = false)
    ArrayList<Integer> SMR = new ArrayList<>();

    public Cases() {
        super();
    }

    public Cases(int numberOfCase, int contract, ArrayList<Integer> SMR) {
        super();
        this.numberOfCase = numberOfCase;
        this.contract = contract;
        this.SMR = SMR;
    }

    public int getNumberOfCase() {
        return numberOfCase;
    }

    public void setNumberOfCase(int numberOfCase) {
        this.numberOfCase = numberOfCase;
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

    @Override
    public String toString() {
        return "Cases{" +
                "numberOfCase=" + numberOfCase +
                ", contract='" + contract + '\'' +
                ", SMR=" + SMR +
                '}';
    }
}
