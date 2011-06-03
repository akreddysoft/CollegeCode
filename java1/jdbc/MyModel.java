import javax.swing.table.AbstractTableModel;
import java.util.*;
import java.io.*;
import java.sql.*;

class MyModel extends AbstractTableModel
{


	private ArrayList alldata;
	
    private String[] cols = {"ID","Name","Address","Telephone"};
    
    
	MyModel()
	{

		GetData();
		
		
	}
	void GetData()
	{
	
		alldata=new ArrayList();
		try
		{
			
			Connection con=DriverManager.getConnection(DataBase.getDriverString()[1],DataBase.getDriverString()[3],DataBase.getDriverString()[4]);
			Statement st=con.createStatement();
			st.execute("select id,name,address,telephone from student");
			ResultSet rs=st.getResultSet();
			while(rs.next())
			{
				alldata.add(rs.getString("id"));
				
				alldata.add(rs.getString("name"));
				alldata.add(rs.getString("address"));
				alldata.add(rs.getString("telephone"));
			}
			
			st.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	}
	
	public int getRowCount()
	{
		//System.out.println(alldata.size()/4);
		return alldata.size()/4;
	}
	public String getColumnName(int i)
	{
		return cols[i];
		
	}
	
	public int getColumnCount()
	{
		return cols.length;
	}
	
	public Object getValueAt(int row, int col)
	{
		return alldata.get(row*4+col);	
	}  
	
}


