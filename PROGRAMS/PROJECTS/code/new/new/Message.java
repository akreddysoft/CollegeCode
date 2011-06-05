import java.awt.*;

import java.awt.event.*;
import java.sql.*;
import java.io.*;
//import java.util.*;


public class  Message
{
    Connection con ;
	Statement  st;
	ResultSet rs;
	PreparedStatement s;
	String gTo,gCc,gBcc,gSubject,gMsg;
	public Message()
	{
		 SetCon();
	}
	      

	       public void setData(String To,String Cc,String Bcc,String Subject,String Msg)
	       {
	   		   try
               {
				//   System.out.println("setData");
		        //   st.executeUpdate("insert into Message values ("+null+","+null+","+null+",'"+To+"','"+Cc+"','"+Bcc+"','"+Subject+"','"+Msg+"',"+null+","+true+","+null+","+null+")");
			      s.setString(4,To);
				  s.setString(5,Cc);
				  s.executeUpdate();
			   }
			    catch(Exception e)
			  {
				    System.out.println(e);
			  }
	       }
/////////////////////        To get Values from the database  ////////////////////////////////

            public void getData()
	       {
	   		  try
              {

				  ComMan m=new ComMan("HELLLO");
				  System.out.println("Now "+m.getLoginName());
				  if (rs.getString(4).compareTo(m.getLoginName())==0)
				  {
					  gTo=rs.getString(3);
					  gCc=rs.getString(5);
					  gBcc=rs.getString(6);
					  gSubject=rs.getString(7);
					  gMsg=rs.getString(8);
				  }
         
			  }
			  catch(Exception e)
			  {
				    System.out.println(e);
			  }
	       }
///////////////////////////////////////////////////////////////////////////////////////////////////////
	

   public void SetCon()
	{
		try
		{
		    System.out.println("Hello World123");
		    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            con=DriverManager.getConnection("Jdbc:Odbc:ComManDsn");
			s=con.prepareStatement("Insert into Message values(?,?)");
            st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		    rs=st.executeQuery("select * from Message");
        }
		catch(Exception e)
		{
		}

	}

	public static void main(String[] args) 
	{
		Message v=new Message();
		v.getData();
	}
}

