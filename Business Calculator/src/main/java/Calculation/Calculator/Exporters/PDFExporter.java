package Calculation.Calculator.Exporters;
import java.awt.Color;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import Calculation.Calculator.Entities.SMR;
import Calculation.Calculator.Entities.Users;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;


public class PDFExporter {

    public static final String fontCyrillic = "HelveticaRegular.ttf";

    private List<Users> listUsers;

    private List<SMR> listSMR;

    private ArrayList<Double> listSMRbyCase;

    private ArrayList<Double> listPricesByCase;

    public PDFExporter(List<Users> listUsers) {
        this.listUsers = listUsers;
    }

    public PDFExporter(List<SMR> listSMR, ArrayList<Double> listSMRbyCase, ArrayList<Double> listPricesByCase) {
        this.listSMR = listSMR;
        this.listSMRbyCase = listSMRbyCase;
        this.listPricesByCase = listPricesByCase;
    }

    private void writeTableHeader(PdfPTable table) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.BLUE);
        cell.setPadding(5);

        Font font = FontFactory.getFont(fontCyrillic, BaseFont.IDENTITY_H, true);
        font.setColor(Color.WHITE);

        cell.setPhrase(new Phrase("Потребители", font));

        table.addCell(cell);

        cell.setPhrase(new Phrase("E-mail", font));
        table.addCell(cell);

    }

    private void writeTableData(PdfPTable table) {
        for (Users user : listUsers) {
            table.addCell(user.getUsername());
            table.addCell(user.getEmail());
        }
    }

    private void writeTableDataForCase(PdfPTable tableCase) {

        tableCase.getDefaultCell().setHorizontalAlignment(tableCase.ALIGN_CENTER);

        for (int i = 0; i < listSMR.size(); i++) {
                if(listSMRbyCase.get(i)>0) {
                    tableCase.addCell(String.valueOf(listSMR.get(i).getPosition()));
                    tableCase.addCell(listSMR.get(i).getAction());
                    tableCase.addCell(listSMR.get(i).getType());
                    tableCase.addCell(String.valueOf(listSMRbyCase.get(i)));
                    tableCase.addCell(String.valueOf(listPricesByCase.get(i)));
                }
            }
        }

    public void export(HttpServletResponse response) throws DocumentException, IOException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());

        document.open();
        Font font = FontFactory.getFont(fontCyrillic, BaseFont.IDENTITY_H, true);
        font.setSize(18);
        font.setColor(Color.BLUE);

        Paragraph p = new Paragraph("Списък с потребители", font);
        p.setAlignment(Paragraph.ALIGN_CENTER);

        document.add(p);

        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100f);
        table.setWidths(new float[] {3.5f, 3.5f});
        table.setSpacingBefore(10);

        writeTableHeader(table);
        writeTableData(table);

        document.add(table);

        document.close();

    }

    private void writeTableHeaderCase(PdfPTable table) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.GRAY);
        cell.setHorizontalAlignment(cell.ALIGN_CENTER);

        Font font = FontFactory.getFont(fontCyrillic, BaseFont.IDENTITY_H, true);
        font.setColor(Color.BLACK);
        font.isBold();

        cell.setPhrase(new Phrase("Позиция", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Дейност", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Тип", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Количество", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Цена, лв.", font));
        table.addCell(cell);

    }

    public void export(HttpServletResponse response, int numberOfCase, String client, String address, double total) throws DocumentException, IOException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());

        document.open();
        Font font = FontFactory.getFont(fontCyrillic, BaseFont.IDENTITY_H, true);
        font.setSize(18);
        font.setColor(Color.BLACK);

        Image img = Image.getInstance("src/main/resources/static/calculator_logo.png");
        img.setAlignment(img.ALIGN_CENTER);

        document.add(img);

        Paragraph p = new Paragraph("Списък СМР" +
                "\nСлучай: " + numberOfCase +
                "\nКлиент: " + client +
                "   Адрес: " + address, font);
        p.setAlignment(Paragraph.ALIGN_CENTER);

        document.add(p);

        PdfPTable table = new PdfPTable(5);
        table.setWidthPercentage(100f);
        table.setWidths(new float[] {1.5f, 4.5f, 1.5f, 1.5f, 2.0f});
        table.setSpacingBefore(10);
        table.setHorizontalAlignment(table.ALIGN_CENTER);

        writeTableHeaderCase(table);
        writeTableDataForCase(table);

        document.add(table);

        Paragraph paragraphTotal = new Paragraph("Обща сума: " + total + " лв.", font);
        paragraphTotal.setAlignment(Paragraph.ALIGN_RIGHT);

        document.add(paragraphTotal);

        document.close();

    }

}