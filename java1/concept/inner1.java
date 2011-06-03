import javax.swing.*;

class myClass
{
    private int mTest = 100;

    // ....

    void doSomething()
    {
        JDialog lDialog = new JDialog();

        // ...

        JButton lCancelButton = new JButton("Cancel");
        lCancelButton.addActionListener(new java.awt.event.ActionListener()
        {
            public void actionPerformed(ActionEvent evt)
            {
                  mTest = 200;  // can do this as mTest is a member variable
                  lDialog.hide();  // cant do this because lDialog is not member variable
                  
            }
        });
    }
}

/*
The only impact that declaring a variable final has is that you can only
ever assign it a value once. Apart from that, final local variables will
behave exactly the same as non-final local variables. final instance
variables however have the additional contraint that they must be assigned
a value, and it must be done when they're declared, or in the constructor(s)
of the class. static final variables must be assigned a value when they are
declared.

Using final can actually improve performance sometimes. If the JVM knows
that a value can't change, it can sometimes make optimisations. But I
wouldn't advise going and making all your variables final, you'll lose
flexibility and except for rare cases, the performance benefit will be
negligible*/

/*
 *When the inner class access a final variable it really doesn't access the
variable itself. What happens underneath is that the inner class gets a
member variable into which is copied the value that the variable had when
the class was created.
*/