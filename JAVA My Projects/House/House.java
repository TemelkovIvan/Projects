package House;

import java.util.Scanner;

public class House {
    public static void main(String[] args) {
Scanner scan = new Scanner(System.in);
        System.out.print("Въведете символ за покрив:");
        String symbolRoof = scan.nextLine();
        System.out.print("Въведете символ за къща:");
        String symbolHouse = scan.nextLine();
        System.out.print("Въведете име за дясна греда на къщата (до 10 символа):");
        String name = scan.nextLine();

        Triangle a = new Triangle(symbolRoof);
        Square b = new Square(symbolHouse,name);

        a.area();
        b.area();
        
    }
}
