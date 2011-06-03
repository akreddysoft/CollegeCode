package sunw.demo.InfoBean;
import java.beans.*;

public class InfoBeanBeanInfo extends SimpleBeanInfo
{
	
	public PropertyDescriptor[] getPropertyDescriptors()
	{
		try
		{
		
			PropertyDescriptor filename=new PropertyDescriptor("path",InfoBean.class);
		//	PropertyDescriptor filename1=new PropertyDescriptor("path1",InfoBean.class);
			PropertyDescriptor pd[]={filename};
			System.out.println("df");
			return pd;
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	
	}
}