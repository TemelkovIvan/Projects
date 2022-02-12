import java.io.*;
import java.util.ArrayList;

public class SimpleNameList {
    private ArrayList<Simple> nameList;

    public SimpleNameList() {
        nameList = new ArrayList<Simple>();
    }
    public void add(Simple simple) {
        nameList.add(simple);
    }
    public ArrayList<Simple> getNames() {
        return nameList;
    }

    public void readFromCSV(String filename) {
        File file = new File(filename);
        FileReader reader = null;
            try {
            reader = new FileReader(file);
        }
            catch (
        FileNotFoundException e) {
            e.printStackTrace();
            System.exit(1);
        }
        BufferedReader infile = new BufferedReader(reader);
        String line = "";
            try {
            boolean done = false;
            while (!done) {
                line = infile.readLine();
                if (line == null) {
                    done = true;
                }
                else {
                    String[] tokens = line.trim().split(",");
                    String title = tokens[0].trim();
                    String author = tokens[1].trim();
                    double price = Double.parseDouble(tokens[2].trim());
                    Simple simple = new Simple(title,author,price);
                    nameList.add(simple);
                }
            }
        }
            catch (
        IOException e) {
            e.printStackTrace();
            System.exit(1);
        }
    }
}
