import com.lowagie.text.Font;
import com.lowagie.text.*;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import java.awt.*;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


public class ExporterPDF {

    public static final String fontCyrillic = "/resources/HelveticaCyrillic.ttf";

    public static void exporter(SimpleNameTableModel tableModel) {
        Document document = new Document(PageSize.A4.rotate());
        try {
            DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
            String currentDateTime = dateFormatter.format(new Date());

            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("jTable-" + currentDateTime + ".pdf"));
            document.open();

            PdfPTable table = new PdfPTable(3);
            table.setWidthPercentage(100f);
            table.setWidths(new float[] {3.5f, 3.5f, 3.5f});
            table.setSpacingBefore(10);

            Font font = FontFactory.getFont(fontCyrillic, BaseFont.IDENTITY_H, true);
            font.setSize(18);
            font.setColor(Color.BLUE);

            Paragraph p = new Paragraph("Table Таблица", font);
            p.setAlignment(Paragraph.ALIGN_CENTER);

            document.add(p);

            writeTableHeader(table, tableModel);
            writeTableData(table, tableModel);

            document.add(table);

        } catch (Exception exception) {
            System.err.println(exception.getMessage());
        }

        document.close();
    }

    private static void writeTableHeader(PdfPTable table, SimpleNameTableModel tableModel) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.GRAY);
        cell.setHorizontalAlignment(cell.ALIGN_CENTER);

        Font font = FontFactory.getFont(fontCyrillic, BaseFont.IDENTITY_H, true);
        font.setColor(Color.BLACK);
        font.isBold();

        cell.setPhrase(new Phrase(tableModel.getColumnName(0), font));
        table.addCell(cell);

        cell.setPhrase(new Phrase(tableModel.getColumnName(1), font));
        table.addCell(cell);

        cell.setPhrase(new Phrase(tableModel.getColumnName(2), font));
        table.addCell(cell);
    }

    private static void writeTableData(PdfPTable table, SimpleNameTableModel tableModel) {

        table.getDefaultCell().setHorizontalAlignment(table.ALIGN_CENTER);

        for (int i = 0; i < tableModel.getRowCount(); i++) {
            for (int j = 0; j < tableModel.getColumnCount(); j++) {
                table.addCell(String.valueOf(tableModel.getValueAt(i,j)));
            }
        }

    }

}
