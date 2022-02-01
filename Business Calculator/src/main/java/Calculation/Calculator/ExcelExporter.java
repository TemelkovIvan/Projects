package Calculation.Calculator;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelExporter {
    private XSSFWorkbook workbook;
    private XSSFSheet sheet;
    private List<Users> listUsers;
    private List<SMR> listSMR;
    private ArrayList<Integer> listSMRbyCase;
    private ArrayList<Double> listPricesByCase;

    public ExcelExporter(List<Users> listUsers) {
        this.listUsers = listUsers;
        workbook = new XSSFWorkbook();
    }

    public ExcelExporter(List<SMR> listSMR, ArrayList<Integer> listSMRbyCase, ArrayList<Double> listPricesByCase) {
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

    private void writeHeaderLineByCase(int numberOfCase, String client, String address) {
        sheet = workbook.createSheet("СМР");

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setColor(HSSFColor.HSSFColorPredefined.BLACK.getIndex());
        font.setFontHeight(16);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);

        Row row_case = sheet.createRow(1);

        createCell(row_case, 0, "Случай:", style);
        createCell(row_case, 1, numberOfCase, style);

        Row row_client_address = sheet.createRow(2);

        createCell(row_client_address, 0, "Клиент:", style);
        createCell(row_client_address, 1, client, style);
        createCell(row_client_address, 3, "Адрес:", style);
        createCell(row_client_address, 4, address, style);


        Row row = sheet.createRow(4);

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
        int rowCount = 5;

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
