package sunw.demo.InfoBean;
import java.beans.*;

public class Listener implements PropertyChangeListener,java.io.Serializable

{
	
	 public Listener()
	 {
	 	new InfoBean().addPropertyChangeListener(this);
	 }
	 public void propertyChange(PropertyChangeEvent evt) 
	 {
	 	System.out.println(evt.getNewValue());
	 	
	 }

	public static void main(String args[])
	{
		new Listener();
	}


}