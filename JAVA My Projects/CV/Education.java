package CV;

import javax.swing.*;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Objects;

public class Education {
    protected void showWindow() {

        JFrame frame = new JFrame("CV Иван Темелков");

        frame.setBounds(200,200,480,450);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().setLayout(null);
        frame.setResizable(false);
        frame.setLocationRelativeTo(null);

        JLabel label = new JLabel("");
        ImageIcon img = new ImageIcon(this.getClass().getResource("/CV/Students.png"));
        label.setIcon(img);
        label.setBounds(15,90,64,64);
        frame.getContentPane().add(label);

        JLabel label1 = new JLabel("");
        ImageIcon img1 = new ImageIcon(this.getClass().getResource("/CV/Students.png"));
        label1.setIcon(img1);
        label1.setBounds(15,180,64,64);
        frame.getContentPane().add(label1);

        JLabel label2 = new JLabel("");
        ImageIcon img2 = new ImageIcon(this.getClass().getResource("/CV/Students.png"));
        label2.setIcon(img2);
        label2.setBounds(15,260,64,64);
        frame.getContentPane().add(label2);

        EducationInfo info = new EducationInfo();
        frame.add(info.master());
        frame.add(info.bachelor());
        frame.add(info.secondary());

        JButton btnOpenWindow = new JButton("Начална страница");
        btnOpenWindow.setBounds(10, 20, 445, 50);
        frame.getContentPane().add(btnOpenWindow);
        btnOpenWindow.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent arg0) {
                frame.setVisible(false);
                FirstPage first = new FirstPage();
                first.showWindow();
            }
        });

        frame.setVisible(true);

    }
}
