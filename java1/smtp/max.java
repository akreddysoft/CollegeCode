import java.awt.*;
import javax.swing.*;

class TestMaxJFrame extends JFrame {
  public TestMaxJFrame() {
   GraphicsEnvironment env =
     GraphicsEnvironment.getLocalGraphicsEnvironment();
   /*
     The next line determines if the   taskbar (win) is covered
     if unremarked, the taskbar will not be covered by
     the maximized JFRAME.
   */
   // this.setMaximizedBounds(env.getMaximumWindowBounds());
   this.setExtendedState(this.getExtendedState() | this.MAXIMIZED_BOTH);
  }

  public static void main(String[] args) {
   JFrame.setDefaultLookAndFeelDecorated(true);
   TestMaxJFrame t = new TestMaxJFrame();
   t.setVisible(true);
  }
}
