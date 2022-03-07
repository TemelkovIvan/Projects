import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class TwoFilesInput {

    public static void filesInput() {

        Scanner infileOne;
        try {
            infileOne = new Scanner(new File("gpsOne.txt"));
            String inputOneLine;
            String[] inputOneSplit;
            double inputOneA;
            double inputOneB;

            List<Double> listOneX = new ArrayList<Double>();
            List<Double> listOneY = new ArrayList<Double>();

            while (infileOne.hasNext()) {
                inputOneLine = infileOne.nextLine();
                inputOneSplit = inputOneLine.trim().split(",");
                inputOneA = Double.parseDouble(inputOneSplit[0].trim());
                inputOneB = Double.parseDouble(inputOneSplit[1].trim());

                listOneX.add(inputOneA);
                listOneY.add(inputOneB);
            }

            infileOne.close();

        Scanner infileTwo;
        try {
            infileTwo = new Scanner(new File("gpsTwo.txt"));
            String inputTwoLine;
            String[] inputTwoSplit;
            double inputTwoA;
            double inputTwoB;

            List<Double> listTwoX = new ArrayList<Double>();
            List<Double> listTwoY = new ArrayList<Double>();

            while (infileTwo.hasNext()) {
                inputTwoLine = infileTwo.nextLine();
                inputTwoSplit = inputTwoLine.trim().split(",");
                inputTwoA = Double.parseDouble(inputTwoSplit[0].trim());
                inputTwoB = Double.parseDouble(inputTwoSplit[1].trim());

                listTwoX.add(inputTwoA);
                listTwoY.add(inputTwoB);
            }

            infileTwo.close();

        try {
            DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
            String currentDateTime = dateFormatter.format(new Date());

            FileWriter csv = new FileWriter(new File("myExportForCheckTwoFiles_" + currentDateTime + ".csv"));

            for (int i = 0; i < listOneX.size(); i++) {
                for (int j = 0; j < listTwoX.size(); j++) {
                    if( distance(listOneX.get(i),listTwoX.get(j),listOneY.get(i),listTwoY.get(j)) >0 && distance(listOneX.get(i),listTwoX.get(j),listOneY.get(i),listTwoY.get(j)) <5) {
                        System.out.println("Съвпaдение!!! Разстоянието е: " + distance(listOneX.get(i),listTwoX.get(j),listOneY.get(i),listTwoY.get(j)) + "m. За координати: " + listOneX.get(i) + "," + listOneY.get(i) + " - " + listTwoX.get(j) + "," + listTwoY.get(j));
                        csv.write("Distance");
                        csv.append(';');
                        csv.write(String.valueOf(distance(listOneX.get(i),listTwoX.get(j),listOneY.get(i),listTwoY.get(j))));
                        csv.append(';');
                        csv.write("FirstFile");
                        csv.append(';');
                        csv.write(String.valueOf(listOneX.get(i)));
                        csv.append(';');
                        csv.write(String.valueOf(listOneY.get(i)));
                        csv.append(';');
                        csv.write("SecondFile");
                        csv.append(';');
                        csv.write(String.valueOf(listTwoX.get(j)));
                        csv.append(';');
                        csv.write(String.valueOf(listTwoY.get(j)));
                        csv.write("\n");
                    }
                }
            }

            csv.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        } catch (FileNotFoundException ex) {
            System.out.println("Can't find file!");
            System.out.println(ex.getMessage());
        } catch (InputMismatchException ex) {
            System.out.println("What is this?");
        }

        } catch (FileNotFoundException ex) {
            System.out.println("Can't find file!");
            System.out.println(ex.getMessage());
        } catch (InputMismatchException ex) {
            System.out.println("What is this?");
        }

    }

    public static double distance(double lat1, double lat2, double lon1, double lon2) {

        final int R = 6371; // Radius of the earth

        double latDistance = Math.toRadians(lat2 - lat1);
        double lonDistance = Math.toRadians(lon2 - lon1);
        double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        double distance = R * c * 1000; // convert to meters

        distance = Math.pow(distance, 2);

        return Math.sqrt(distance);
    }

}
