import java.awt.*;

/* The following class prints the text "Hello World!" to the screen */
class HelloWorldApp
{
  public static void main(String args[])
  {
    ExitButton button;
    String     lbl; 

    button = new ExitButton("Exit!"); 
    if (args.length == 0)
      lbl = "Give argument!"; 
    else
      lbl = args[0];

    Frame mainFrame = new Frame("HelloWorldApp"); 
    Label HelloWorldlbl = new Label(lbl, Label.CENTER); 
    mainFrame.add("Center", HelloWorldlbl); 
    mainFrame.add("South", button); 
    mainFrame.resize(450, 450);
    mainFrame.show();
  }
}

class ExitButton extends Button
{

  public ExitButton(String buttonLbl)
  {
    setLabel(buttonLbl);
  }

  public boolean action(Event evt, Object arg)
  {
    System.exit(0);
    return true;
  }
} 
