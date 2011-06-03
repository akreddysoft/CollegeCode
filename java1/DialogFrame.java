import java.awt.*;
import java.awt.event.*;

public class DialogFrame extends Frame implements ActionListener, WindowListener {

     Dialog dialog;
     Button openDialogButton;
     Button closeDialogButton;
     Button closeFrameButton;

     public DialogFrame() {
          super("Dialog and Frame example");
          setLayout(new FlowLayout());
          addWindowListener(this);

          openDialogButton = new Button("Open dialog");
          openDialogButton.addActionListener(this);

          closeFrameButton = new Button("Close me");
          closeFrameButton.addActionListener(this);

          add(openDialogButton);
          add(closeFrameButton);

          pack();
          show();
     }

     public void showDialog() {
          dialog = new Dialog(this, "This is the dialog", true);
          dialog.setLayout(new FlowLayout());
          dialog.addWindowListener(this);

          closeDialogButton = new Button("Close dialog");
          closeDialogButton.addActionListener(this);

          dialog.add(closeDialogButton);

          dialog.pack();
          dialog.show();
     }

     public void actionPerformed(ActionEvent e) {
          String buttonCommand = e.getActionCommand();
          if(buttonCommand.equals("Open dialog"))
               showDialog();
          else if(buttonCommand.equals("Close dialog"))
               dialog.dispose();
          else if(buttonCommand.equals("Close me"))
               processEvent(new WindowEvent(this, WindowEvent.WINDOW_CLOSING));
     }

     public void windowClosing(WindowEvent e) {
          Window originator = e.getWindow();
          if(originator.equals(this)) {
               this.dispose();
               System.exit(0);
          } else if(originator.equals(dialog))
               dialog.dispose();
     }

     public void windowActivated(WindowEvent e) { }
     public void windowDeactivated(WindowEvent e) { }
     public void windowDeiconified(WindowEvent e) { }
     public void windowClosed(WindowEvent e) { }
     public void windowIconified(WindowEvent e) { }
     public void windowOpened(WindowEvent e) { }

     public static void main(String[] args) {
          DialogFrame me = new DialogFrame();
     }
}
