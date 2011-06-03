import javax.swing.table.*;
import javax.swing.*;
import java.awt.event.*;
import java.awt.*;

/**Author Sonal Goyal, sonal_goyal@hotmail.com
*/

class MyTable extends JTable{

      //default constructor
      public MyTable(){
           super();
           }

      //constructor to create a table with given number of rows and columns
        public MyTable(int row, int col){
            super(row, col);
            }
     }


class TableColumnTest{

    protected JFrame frame;
    protected JScrollPane scrollpane;
    protected MyTable table;

    public TableColumnTest(){

      //(1) Create the table model.
      DefaultTableModel dm = new DefaultTableModel();

      // Names for each of the columns.
      String[] columnNames = {
            "This is going to be a really long column header",
            "Column B", "Column C", "Column D", "Column E", "Column F",
            "Column G", "Column H", "Column I",  "Column J"
            };

      // The actual data values.
      Integer[][] data = new Integer[8][10];

      // Populate the data matrix.
      for (int row = 0; row < 8; row++){
            for (int col = 0; col < 10; ++col){
                  data[row][col] = new Integer(1000000);
            }
      }

      // Configure the model with the data and column headers.
      dm.setDataVector(data, columnNames);

      //(2) Create the table.
      table = new MyTable();

      //(3) Connect the model to the table.
      table.setModel(dm);

      //(4) Create a scroll pane for the table.
      scrollpane =  new JScrollPane(table);

      //(5) Make the table visible.
      frame =  new JFrame();
      frame.getContentPane().add(scrollpane);
      frame.setSize(200, 150);
      frame.setVisible(true);
  }

public static void main(String[] args){
       TableColumnTest test = new TableColumnTest();
}

}
