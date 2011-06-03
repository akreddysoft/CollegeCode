import javax.swing.*;
import javax.swing.event.*;
import java.awt.event.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import javax.swing.table.AbstractTableModel;

class tablemodel extends AbstractTableModel

 {
 	
 	   private boolean DEBUG = false;

        private String[] columnNames = {"IP Address",
                                        "Host Name",
                                        "Open/closed",
                                        "Selected"
                                        };
        Object[][] data=new Object[255][4];//={{"fgfgd","fgfg",new Boolean(true),new Boolean(true)},{"df","df","df",new Boolean(true),new Boolean(true)}};
        tablemodel()
        {
        	int i,j;
	        
	        for(i=0;i<255;++i)
	        {
	        	for(j=0;j<4;++j)
	        	{	if(j>=0&&j<=1)
	        			data[i][j]=new String("");
	        		if(j==2)
	        			data[i][j]=new Boolean(true);
	        		if(j==3)
	        			data[i][j]=new Boolean(true);
	        	}
	        }
	       // System.out.println(getColumnCount());
        //Object[][] data=new Object[55][55];
        }
        

        
        public int getColumnCount()
         {
            return columnNames.length;
        }

        public int getRowCount()
         {
         	int i;
         	for( i=0;i<255;++i)
         	{
         		if(data[i][0].equals(""))	
         			break;		//return only scanned number of row
         	}
            return i;
            //return data.length;
        }

        public String getColumnName(int col)
         {
            return columnNames[col];
        }

        public Object getValueAt(int row, int col)
         {
            return data[row][col];
        }

        /*
         * JTable uses this method to determine the default renderer/
         * editor for each cell.  If we didn't implement this method,
         * then the last column would contain text ("true"/"false"),
         * rather than a check box.
         */
        public Class getColumnClass(int c) 
        {
            return getValueAt(0, c).getClass();
        }

        /*
         * Don't need to implement this method unless your table's
         * editable.
         */
        public boolean isCellEditable(int row, int col) {
            //Note that the data/cell address is constant,
            //no matter where the cell appears onscreen.
            if (col < 2) {
                return false;
            } else {
                return true;
            }
        }

        /*
         * Don't need to implement this method unless your table's
         * data can change.
         */
        public void setValueAt(Object value, int row, int col)
         {
            if (DEBUG)
             {
                System.out.println("Setting value at " + row + "," + col
                                   + " to " + value
                                   + " (an instance of "
                                   + value.getClass() + ")");
            }

        	if(col!=2)		//cannot change the contents of second last column
            data[row][col] = value;
            fireTableCellUpdated(row, col);

            if (DEBUG)
             {
                System.out.println("New value of data:");
                printDebugData();
            }
        }

        private void printDebugData() 
        {
            int numRows = getRowCount();
            int numCols = getColumnCount();

            for (int i=0; i < numRows; i++)
             {
                System.out.print("    row " + i + ":");
                for (int j=0; j < numCols; j++) 
                {
                    System.out.print("  " + data[i][j]);
                }
                System.out.println();
            }
            System.out.println("--------------------------");
        }
    }