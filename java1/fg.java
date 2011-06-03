import javax.swing.*;
import java.awt.*;


class JFrame_1 extends javax.swing.JFrame {
  public JFrame_1() {
    java.awt.GridBagConstraints gridBagConstraints;

     javax.swing.JTextField jTextField1 = new javax.swing.JTextField();
     javax.swing.JTextField jTextField2 = new javax.swing.JTextField();

    getContentPane().setLayout(new java.awt.GridBagLayout());

    jTextField1.setText("mmmmmmmmmmmmmmmm");
    gridBagConstraints = new java.awt.GridBagConstraints();
    gridBagConstraints.gridwidth = java.awt.GridBagConstraints.REMAINDER;
    getContentPane().add(jTextField1, gridBagConstraints);

    jTextField2.setText("Hello.");
    gridBagConstraints = new java.awt.GridBagConstraints();
    gridBagConstraints.fill = java.awt.GridBagConstraints.HORIZONTAL;
    getContentPane().add(jTextField2, gridBagConstraints);

    pack();
  }
  public static void main(String args[]) {
    new JFrame_1().show();
  }
}