import javax.swing.*;
import javax.swing.table.TableModel;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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

    public static boolean exportToCSV(JTable tableToExport) {

        try {
            DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
            String currentDateTime = dateFormatter.format(new Date());

            TableModel model = tableToExport.getModel();
            FileWriter csv = new FileWriter(new File("myExportedData" + currentDateTime + ".csv"));

            for (int i = 0; i < model.getRowCount(); i++) {
                for (int j = 0; j < model.getColumnCount(); j++) {
                    csv.write(model.getValueAt(i, j).toString() + ",");
                }
                csv.write("\n");
            }

            csv.close();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }
}
