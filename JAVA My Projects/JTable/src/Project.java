import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableCellRenderer;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.MessageFormat;


public class Project{


    private SimpleNameTableModel tableModel;
    private SimpleNameList myList;

    protected void showWindow() {

        JFrame frame = new JFrame("Project");

        frame.setSize(500, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setBounds(200,200,880,450);
        frame.setResizable(false);
        frame.setLocationRelativeTo(null);

        myList = new SimpleNameList();

        Simple rowOne = new Simple("test1", "test_1", 22.50);
        Simple rowTwo = new Simple("test2", "test_2", 322.50);
        Simple rowThree = new Simple("test3", "test_3", 442.50);
        myList.add(rowOne);
        myList.add(rowTwo);
        myList.add(rowThree);

        tableModel = new SimpleNameTableModel(myList);

        JTable jTable = new JTable(tableModel){
            public Component prepareRenderer(TableCellRenderer renderer,
                                             int row, int column)
            {
                Component c = super.prepareRenderer(renderer, row, column);
                Color color1 = new Color(220,220,220);
                Color color2 = Color.WHITE;
                if(!c.getBackground().equals(getSelectionBackground())) {
                    Color coleur = (row % 2 == 0 ? color1 : color2);
                    c.setBackground(coleur);
                    coleur = null;
                }
                return c;
            }
        };
        jTable.setAutoCreateRowSorter(true);
        jTable.setShowHorizontalLines(true);
        jTable.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
        jTable.setSelectionBackground(Color.red);
        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
        centerRenderer.setHorizontalAlignment( JLabel.CENTER );
        jTable.getColumnModel().getColumn(1).setCellRenderer( centerRenderer );

        JScrollPane scrollPane = new JScrollPane(jTable);
        frame.add(scrollPane);

        JButton buttonExport = new JButton("Export");

        JButton jButton5 = new JButton("New Row");
        jButton5.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                Simple row = new Simple("", "", 0.00);
                myList.add(row);
                System.out.println("new row");
                frame.add(scrollPane, BorderLayout.CENTER);
                }
            });

        JButton jButton6 = new JButton("Del Row");

        JButton buttonInsert = new JButton("Insert");
        buttonInsert.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                System.out.println("Insert");
                /*
                myList = new SimpleNameList();
                myList.readFromCSV("names.csv");
                tableModel = new SimpleNameTableModel(myList);

                JTable jTable = new JTable(tableModel);
                jTable.setAutoCreateRowSorter(true);
                JScrollPane scrollPane = new JScrollPane(jTable);
                scrollPane.setPreferredSize(new Dimension(380,280));
                JPanel panel = new JPanel();
                panel.add(scrollPane);
                add(panel,BorderLayout.CENTER);
                 */
            }
        });

        JButton buttonPDF = new JButton("PDF");
        buttonPDF.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent e) {
                ExporterPDF.exporter(tableModel);
            }
        });

        JButton buttonPrint = new JButton("Print");
        buttonPrint.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                MessageFormat header = new MessageFormat("Таблица");
                MessageFormat footer = new MessageFormat("-");

                try {
                    jTable.print(JTable.PrintMode.FIT_WIDTH, header, footer);
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(null, ex);
                }
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(frame.getContentPane());
        frame.getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addGroup(layout.createSequentialGroup()
                                                .addContainerGap()
                                                .addComponent(scrollPane, javax.swing.GroupLayout.PREFERRED_SIZE, 375, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                                                .addGap(0, 0, Short.MAX_VALUE)
                                                                .addComponent(buttonExport, javax.swing.GroupLayout.PREFERRED_SIZE, 92, javax.swing.GroupLayout.PREFERRED_SIZE))
                                                        .addComponent(buttonInsert, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                        .addGroup(layout.createSequentialGroup()
                                                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                                                                .addComponent(buttonPrint, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                                                .addComponent(buttonPDF, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                                                        .addComponent(jButton5)
                                                                        .addComponent(jButton6))
                                                                .addGap(0, 0, Short.MAX_VALUE))))
                                        .addGroup(layout.createSequentialGroup()
                                                .addGap(21, 21, 21)))
                                .addContainerGap())
        );
        layout.setVerticalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                                .addGap(16, 16, 16)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addGroup(layout.createSequentialGroup()
                                                .addComponent(jButton5)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                .addComponent(jButton6)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                .addComponent(buttonInsert)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                .addComponent(buttonExport)
                                                .addGap(57, 57, 57)
                                                .addComponent(buttonPDF)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                .addComponent(buttonPrint)
                                                .addGap(39, 39, 39))
                                        .addGroup(layout.createSequentialGroup()
                                                .addComponent(scrollPane, javax.swing.GroupLayout.PREFERRED_SIZE, 275, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );
        frame.pack();
        frame.setVisible(true);
    }


}
