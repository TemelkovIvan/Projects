import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class OneFileInput {

    public static void fileInput() {

        Scanner infile;
        try {
            infile = new Scanner(new File("gps.txt"));
            String inputLine;
            String[] inputSplit;
            double inputA;
            double inputB;

            List<Double> listX = new ArrayList<Double>();
            List<Double> listY = new ArrayList<Double>();

            while (infile.hasNext()) {
                inputLine = infile.nextLine();
                inputSplit = inputLine.trim().split(",");
                inputA = Double.parseDouble(inputSplit[0].trim());
                inputB = Double.parseDouble(inputSplit[1].trim());

                listX.add(inputA);
                listY.add(inputB);
            }

            infile.close();

            try {
                DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
                String currentDateTime = dateFormatter.format(new Date());

                FileWriter csv = new FileWriter(new File("myExport_" + currentDateTime + ".csv"));

                for (int i = 0; i < listX.size(); i++) {
                    for (int j = 0; j < listX.size(); j++) {
                        if( distance(listX.get(i),listX.get(j),listY.get(i),listY.get(j)) >0 && distance(listX.get(i),listX.get(j),listY.get(i),listY.get(j)) <5) {
                            System.out.println("Съвпaдение!!! Разстоянието е: " + distance(listX.get(i),listX.get(j),listY.get(i),listY.get(j)) + "m. За координати: " + listX.get(i) + "," + listY.get(i) + " - " + listX.get(j) + "," + listY.get(j));
                            csv.write(String.valueOf(distance(listX.get(i),listX.get(j),listY.get(i),listY.get(j))));
                            csv.append(';');
                            csv.write(String.valueOf(listX.get(i)));
                            csv.append(';');
                            csv.write(String.valueOf(listY.get(i)));
                            csv.append(';');
                            csv.write(String.valueOf(listX.get(j)));
                            csv.append(';');
                            csv.write(String.valueOf(listY.get(j)));
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

