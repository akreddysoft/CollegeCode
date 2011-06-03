import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

class GUI implements ActionListener {

    JFrame frame;
    JPanel leaguemenu, clubmenu, playermenu;
    final static String LOOKANDFEEL = null;

     ///////////// CONSTRUCTOR /////////////
    public GUI() {  //static?
        //Set the look and feel.
        initLookAndFeel();
        //Make sure we have nice window decorations.
        JFrame.setDefaultLookAndFeelDecorated(true);
        // set up the main window
        frame = new JFrame("League Administrator (Zac Craven - 2004)");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(new Dimension(120, 40));


        Component tabs = createTabs();
        Component leaguemenu = leagueMenu();
        Component clubmenu = clubMenu();
        Component playermenu = playerMenu();

        frame.getContentPane().add(tabs, BorderLayout.NORTH);
        frame.getContentPane().add(leaguemenu, BorderLayout.CENTER);
        //  frame.getContentPane().add(clubmenu, BorderLayout.CENTER);
        frame.pack();
        frame.setVisible(true);
    }



    public Component leagueMenu(){
        JPanel league = new JPanel();
        Component buttons = createLeagueButtons();
        Component display = createDisplay();
        league.add(buttons, BorderLayout.EAST);
        league.add(display, BorderLayout.WEST);
        return league;
    }

    public Component clubMenu(){
        JPanel club = new JPanel();
        Component buttons = createClubButtons();
        Component display = createDisplay();
        club.add(buttons, BorderLayout.EAST);
        club.add(display, BorderLayout.WEST);
        return club;
    }

    public Component playerMenu(){
        JPanel player = new JPanel();
        player.setLayout(new GridLayout(0,1));
        Component buttons = createPlayerButtons();
        Component display = createDisplay();
        player.add(buttons, BorderLayout.EAST);
        player.add(display, BorderLayout.WEST);
        return player;
    }

    public Component createTabs(){
        JTabbedPane tabbedPane = new JTabbedPane();

        JComponent leaguemenu = makeTextPanel("the League Menu");
        tabbedPane.addTab("League Menu", leaguemenu);
        tabbedPane.setMnemonicAt(0, KeyEvent.VK_1);

        JComponent panel2 = makeTextPanel("da club");
        tabbedPane.addTab("Club Menu", clubmenu);
        tabbedPane.setMnemonicAt(1, KeyEvent.VK_2);

        JComponent panel3 = makeTextPanel("da player");
        tabbedPane.addTab("Player Menu", playermenu);
        tabbedPane.setMnemonicAt(2, KeyEvent.VK_3);

        return tabbedPane;
    }

    protected JComponent makeTextPanel(String text) {
        JPanel panel = new JPanel(false);
        JLabel filler = new JLabel(text);
        filler.setHorizontalAlignment(JLabel.CENTER);
        panel.setLayout(new GridLayout(1, 1));
        panel.add(filler);
        return panel;
    }

    public Component createLeagueButtons() {

        JPanel toolbar = new JPanel();
        toolbar.setLayout(new GridLayout(0,1));
        JButton createClubButton = new JButton("Create Club");
        toolbar.add(createClubButton);
        JButton addClubButton = new JButton("Add Club");
        toolbar.add(addClubButton);

        JPanel flow = new JPanel();
        flow.add(toolbar);
        return flow;
    }

    public Component createClubButtons() {
        JPanel toolbar = new JPanel();
        toolbar.setLayout(new GridLayout(0,1));
        JButton addPlayerButton = new JButton("Add Player");
        toolbar.add(addPlayerButton);
        JPanel flow = new JPanel();
        flow.add(toolbar);
        return flow;
    }

    public Component createPlayerButtons() {
        JPanel toolbar = new JPanel();
        toolbar.setLayout(new GridLayout(0,1));
        JButton addPlayerButton = new JButton("Add Player?");
        toolbar.add(addPlayerButton);
        JPanel flow = new JPanel();
        flow.add(toolbar);
        return flow;
    }

    public Component createDisplay() {

        //Create the display panel for the clubs in the league.
        JPanel displayPanel = new JPanel();

        //Add various widgets to the sub panels.
   //     addWidgets();

        //Create the main panel to contain the two sub panels.
        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.PAGE_AXIS));
        // Add border around the select panel

mainPanel.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createTitledBorder("Premiership"),
        BorderFactory.createEmptyBorder(5,5,5,5)));

        //Add display panels to the main panel.
        mainPanel.add(displayPanel);
        return mainPanel;
    }

    public void actionPerformed(ActionEvent e) {
     //   numClicks++;
       // label.setText(labelPrefix + numClicks);
    }




//dont worry about stuff below here //
    private static void initLookAndFeel() {
        String lookAndFeel = null;

        if (LOOKANDFEEL != null) {
            if (LOOKANDFEEL.equals("Metal")) {
                lookAndFeel =
UIManager.getCrossPlatformLookAndFeelClassName();
            } else if (LOOKANDFEEL.equals("System")) {
                lookAndFeel = UIManager.getSystemLookAndFeelClassName();
            } else if (LOOKANDFEEL.equals("Motif")) {
                lookAndFeel ="com.sun.java.swing.plaf.motif.MotifLookAndFeel";
            } else if (LOOKANDFEEL.equals("GTK+")) {
                lookAndFeel = "com.sun.java.swing.plaf.gtk.GTKLookAndFeel";
            } else {
                System.err.println("Unexpected value of LOOKANDFEELspecified: "
                                   + LOOKANDFEEL);
                lookAndFeel =
UIManager.getCrossPlatformLookAndFeelClassName();
            }

            try {
                UIManager.setLookAndFeel(lookAndFeel);
            } catch (ClassNotFoundException e) {
                System.err.println("Couldn't find class for specified lookand feel:"
                                   + lookAndFeel);
                System.err.println("Did you include the L&F library in theclass path?");
                System.err.println("Using the default look and feel.");
            } catch (UnsupportedLookAndFeelException e) {
                System.err.println("Can't use the specified look and feel ("
                                   + lookAndFeel
                                   + ") on this platform.");
                System.err.println("Using the default look and feel.");
            } catch (Exception e) {
                System.err.println("Couldn't get specified look and feel ("
                                   + lookAndFeel
                                   + "), for some reason.");
                System.err.println("Using the default look and feel.");
                e.printStackTrace();
            }
        }
    }

    private static void createAndShowGUI() {
        //Make sure we have nice window decorations.
        JFrame.setDefaultLookAndFeelDecorated(true);
        GUI app = new GUI();
    }

    public static void main(String[] args) {
        //Schedule a job for the event-dispatching thread:
        //creating and showing this application's GUI.
        javax.swing.SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                createAndShowGUI();
            }
        });
    }
}