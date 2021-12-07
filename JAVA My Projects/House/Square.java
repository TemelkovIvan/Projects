package House;

public class Square {
    String u;
    String name;

    /**
     * Create array with the name entered
     *
     * @param name - A string with the name entered
     * @param u    - Symbol
     */
    public void area() {

        String[] arrayOne = new String[10];
        for (int i = 0; i < 10; i++) {
            arrayOne[i] = u;
        }
        String[] arrayTwo = name.split("");
        for (int i = 0; i < arrayTwo.length; i++) {
            arrayOne[i] = arrayTwo[i];
        }

        /*
         * Tests at creation
         */
        //System.out.println(java.util.Arrays.toString(arrayOne));
        //System.out.println(java.util.Arrays.toString(arrayTwo));

        System.out.println(basis(u));
        for (int i = 0; i < 10; i++) {
            System.out.print(u);
            for (int j = 0; j < 29; j++) {
                System.out.print(" ");
            }
            //System.out.println(u);
            System.out.println(arrayOne[i]);
        }
        System.out.println(basis(u));
    }

    /**
     * Create basis a base and a roof
     */
    private static String basis(String u) {
        for (int i = 0; i < 15; i++) {
            System.out.print(u + " ");
        }
        return u;
    }

    /**
     * Constructor for @param u and @param name
     */
    public Square(String u, String name) {
        this.u = u;
        this.name = name;
    }

}
