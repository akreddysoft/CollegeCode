import javax.swing.table.AbstractTableModel;
import java.util.*;
import java.io.*;

class MyModel extends AbstractTableModel
{
	private MyFile mf;

	private ArrayList alldata;
	
    private String[] cols = {"Name","Address","Telephone"};
    
    
	MyModel(MyFile mf)
	{
		this.mf=mf;
		GetData();
		
	}
	void GetData()
	{
		alldata=new ArrayList();
		Object obj1=null;

		ObjectInputStream ois=mf.getReader();
		if(ois==null)	return;
		MyData data;
		while(true)
		{
			
			try
			{
				obj1=ois.readObject();
		
			}
			catch(EOFException e)
			{
				System.out.println("eof reached");
				break;
			}
			catch(Exception e)
			{
				e.printStackTrace();
				break;
			}
			
			
			if(obj1 instanceof Null)
			{
				try
				{
				
					ois=new ObjectInputStream(mf.br);
					obj1=ois.readObject();
				}
				catch(EOFException e)
				{
					System.out.println("eof1 reached");
					break;
				}
				catch(Exception e)
				{
					e.printStackTrace();
					break;
				}
				
			}
			
			String str[]=obj1.toString().split(":");
 		    for(int i=0;i<str.length;++i)
 		    	alldata.add(str[i]);	
		}	

		try
		{
			mf.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
	
	public int getRowCount()
	{
		return alldata.size()/3;
	}
	
	public int getColumnCount()
	{
		return cols.length;
	}
	
	public Object getValueAt(int row, int col)
	{
		return alldata.get(row*3+col);	
	}  
	
}


