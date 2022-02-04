package Calculation.Calculator.Exporters;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import Calculation.Calculator.Entities.SMR;
import Calculation.Calculator.Entities.Users;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.*;
import org.junit.runners.model.TestClass;

public class ExcelExporter {
    private XSSFWorkbook workbook;
    private XSSFSheet sheet;
    private List<Users> listUsers;
    private List<SMR> listSMR;
    private ArrayList<Double> listSMRbyCase;
    private ArrayList<Double> listPricesByCase;

    public ExcelExporter(List<Users> listUsers) {
        this.listUsers = listUsers;
        workbook = new XSSFWorkbook();
    }

    public ExcelExporter(List<SMR> listSMR, ArrayList<Double> listSMRbyCase, ArrayList<Double> listPricesByCase) {
        this.listSMR = listSMR;
        this.listSMRbyCase = listSMRbyCase;
        this.listPricesByCase = listPricesByCase;
        workbook = new XSSFWorkbook();
    }

    private void writeHeaderLine() {
        sheet = workbook.createSheet("Потребители");

        Row row = sheet.createRow(0);

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setColor(HSSFColor.HSSFColorPredefined.BLUE_GREY.getIndex());
        font.setFontHeight(16);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);

        createCell(row, 0, "ID в база данни", style);
        createCell(row, 1, "Потребител", style);
        createCell(row, 2, "E-mail", style);

    }

    private void writeHeaderLineByCase(int numberOfCase, String client, String address) throws IOException {
        sheet = workbook.createSheet("СМР");

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setColor(HSSFColor.HSSFColorPredefined.BLACK.getIndex());
        font.setFontHeight(16);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);

        InputStream inputStream = TestClass.class.getClassLoader()
                .getResourceAsStream("static/calculator_logo.png");
        //Get the contents of an InputStream as a byte[].
        byte[] bytes = IOUtils.toByteArray(inputStream);
        //Adds a picture to the workbook
        int pictureIdx = workbook.addPicture(bytes, workbook.PICTURE_TYPE_PNG);
        //close the input stream
        inputStream.close();
        //Returns an object that handles instantiating concrete classes
        CreationHelper helper = workbook.getCreationHelper();
        //Creates the top-level drawing patriarch.
        Drawing drawing = sheet.createDrawingPatriarch();

        //Create an anchor that is attached to the worksheet
        ClientAnchor anchor = helper.createClientAnchor();

        //create an anchor with upper left cell _and_ bottom right cell
        anchor.setCol1(0); //Column A
        anchor.setRow1(1); //Row 2
        anchor.setCol2(4); //Column C
        anchor.setRow2(3); //Row 4

        //Creates a picture
        Picture pict = drawing.createPicture(anchor, pictureIdx);

        //Reset the image to the original size
        pict.resize(); //don't do that. Let the anchor resize the image!

        Row row_case = sheet.createRow(4);

        createCell(row_case, 0, "Случай:", style);
        createCell(row_case, 1, numberOfCase, style);

        Row row_client_address = sheet.createRow(6);

        createCell(row_client_address, 0, "Клиент:", style);
        createCell(row_client_address, 1, client, style);
        createCell(row_client_address, 3, "Адрес:", style);
        createCell(row_client_address, 4, address, style);


        Row row = sheet.createRow(7);

        createCell(row, 0, "Позиция", style);
        createCell(row, 1, "Дейност", style);
        createCell(row, 2, "Тип", style);
        createCell(row, 3, "Количество", style);
        createCell(row, 4, "Цена, лв.", style);
    }

    private void createCell(Row row, int columnCount, Object value, CellStyle style) {
        sheet.autoSizeColumn(columnCount);
        Cell cell = row.createCell(columnCount);
        if (value instanceof Integer) {
            cell.setCellValue((Integer) value);
        } else if (value instanceof Boolean) {
            cell.setCellValue((Boolean) value);
        }else {
            cell.setCellValue((String) value);
        }
        cell.setCellStyle(style);
    }

    private void writeDataLines() {
        int rowCount = 1;

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setFontHeight(14);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);

        for (Users user : listUsers) {
            Row row = sheet.createRow(rowCount++);
            int columnCount = 0;

            createCell(row, columnCount++, user.getId(), style);
            createCell(row, columnCount++, user.getUsername(), style);
            createCell(row, columnCount++, user.getEmail(), style);

        }
    }

    private void writeDataLinesByCase(double total) {
        int rowCount = 8;

        CellStyle style = workbook.createCellStyle();
        CellStyle style_total = workbook.createCellStyle();

        XSSFFont font = workbook.createFont();
        font.setFontHeight(14);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);

        XSSFFont font_total = workbook.createFont();
        font_total.setColor(HSSFColor.HSSFColorPredefined.BLUE.getIndex());
        font_total.setFontHeight(14);
        style_total.setFont(font_total);
        style_total.setAlignment(HorizontalAlignment.LEFT);

        for (int i = 0; i < listSMR.size(); i++) {

            if(listSMRbyCase.get(i)>0) {

                Row row = sheet.createRow(rowCount++);
                int columnCount = 0;

                createCell(row, columnCount++, String.valueOf(listSMR.get(i).getPosition()), style);
                createCell(row, columnCount++, listSMR.get(i).getAction(), style);
                createCell(row, columnCount++, listSMR.get(i).getType(), style);
                createCell(row, columnCount++, String.valueOf(listSMRbyCase.get(i)), style);
                createCell(row, columnCount++, String.valueOf(listPricesByCase.get(i)), style);
                createCell(sheet.createRow(rowCount), columnCount - 1, "Общо: " + total + " лв.", style_total);
            }
        }


    }

    public void export(HttpServletResponse response) throws IOException {
        writeHeaderLine();
        writeDataLines();

        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();

        outputStream.close();

    }

    public void export(HttpServletResponse response, int numberOfCase, String client, String address, double total) throws IOException {
        writeHeaderLineByCase(numberOfCase, client, address);
        writeDataLinesByCase(total);

        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();

        outputStream.close();

    }
}
