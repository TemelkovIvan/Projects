package House;

public class Triangle {
    public String T;

    public void area() {
        for (int i = 0; i < 8; i++) {
            for (int j = 15 - i * 2; j > 0; j--) {
                System.out.print(" ");}
            for( int k = 0; k <=i*4;k++ ){
                    System.out.print(T);
            }
            System.out.println("");
        }
    }

    /**
     * Constructor for @param T
     */
    public Triangle(String T) {
        this.T=T;
    }
}



