package Calculation.Calculator;
import java.awt.Color;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;


public class UserPDFExporter {

    public static final String fontCyrillic = "HelveticaRegular.ttf";

    private List<Users> listUsers;

    public UserPDFExporter(List<Users> listUsers) {
        this.listUsers = listUsers;
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

}