import com.lowagie.text.Font;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

import javax.swing.*;
import java.awt.*;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ExporterPDFtest {

    public static final String fontCyrillic = "/resources/HelveticaCyrillic.ttf";

    public static void exporter(JTable jTable) {
        Document document = new Document(PageSize.A4.rotate());
        try {
            DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
            String currentDateTime = dateFormatter.format(new Date());

            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("jTable-" + currentDateTime + ".pdf"));
            document.open();
            PdfContentByte cb = writer.getDirectContent();

            cb.saveState();
            Graphics2D g2 = cb.createGraphicsShapes(500, 500);

            Shape oldClip = g2.getClip();
            g2.clipRect(0, 0, 500, 500);

            Font font = FontFactory.getFont(fontCyrillic, BaseFont.IDENTITY_H, true);
            font.setSize(18);
            font.setColor(Color.BLUE);

            Paragraph p = new Paragraph("Table Таблица", font);
            p.setAlignment(Paragraph.ALIGN_CENTER);

            document.add(p);

            PdfPTable table = new PdfPTable(3);
            table.setWidthPercentage(100f);
            table.setWidths(new float[] {3.5f, 3.5f, 3.5f});
            table.setSpacingBefore(10);

            PdfPCell cell = new PdfPCell();
            cell.setBackgroundColor(Color.BLACK);
            cell.setPadding(5);
            cell.setPhrase(new Phrase("test1",font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("test2"));
            table.addCell(cell);
            cell.setPhrase(new Phrase("test3"));
            table.addCell(cell);

            document.add(table);

            jTable.print(g2);
            g2.setClip(oldClip);

            g2.dispose();
            cb.restoreState();
        } catch (Exception exception) {
            System.err.println(exception.getMessage());
        }
        document.close();
    }
}
