import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;

public class SimpleNameTableModel extends AbstractTableModel {
    private String[] columnNames = {"Name","LastName","Salary"};
    private ArrayList<Simple> myList;

    public SimpleNameTableModel(SimpleNameList nameList) {
        myList = nameList.getNames();
    }

    public int getRowCount() {
        int size;
        if (myList == null) {
            size = 0;
        }
        else {
            size = myList.size();
        }
        return size;
    }

    public int getColumnCount() {
        return columnNames.length;
    }

    public Object getValueAt(int row, int col) {
        Object temp = null;
        if (col == 0) {
            temp = myList.get(row).getName();
        }
        else if (col == 1) {
            temp = myList.get(row).getLastName();
        }
        else if (col == 2) {
            temp = new Double(myList.get(row).getSalary());
        }
        return temp;
    }

    // needed to show column names in JTable
    public String getColumnName(int col) {
        return columnNames[col];
    }

    public Class getColumnClass(int col) {
        if (col == 2) {
            return Double.class;
        }
        else {
            return String.class;
        }
    }

    @Override
    public boolean isCellEditable(int rowIndex, int columnIndex)
    {
        return true;
    }

    @Override
    public void setValueAt(Object aValue, int row, int col)
    {
        Simple temp = myList.get(row);
        if (col == 0) {
            temp.setName((String)aValue);
        }
        else if (col == 1) {
            temp.setLastName((String)aValue);
        }
        else if (col == 2) {
            temp.setSalary((Double) aValue);
        }
    }

    public void removeRow(int selectedRow) {
        myList.remove(selectedRow);
    }

    public void removeAll() {
        myList.removeAll(myList);
    }
}
