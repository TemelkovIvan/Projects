package CV;

import javax.swing.*;

import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Objects;

public class Education {
	protected void showWindow() {

		JFrame frame = new JFrame("CV Иван Темелков - Образование");

		frame.setBounds(200, 200, 480, 450);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		frame.setResizable(false);
		frame.setLocationRelativeTo(null);

		/*JLabel label11 = new JLabel("");
        Image img11 = new ImageIcon(Objects.requireNonNull(this.getClass().getResource("/Book.png"))).getImage();
        label11.setIcon(new ImageIcon(img11));
        label11.setBounds(5,0,450,450);
        frame.getContentPane().add(label11);
		*/
		
		JLabel label = new JLabel("");
        Image img = new ImageIcon(Objects.requireNonNull(this.getClass().getResource("/Students.png"))).getImage();
        label.setIcon(new ImageIcon(img));
        label.setBounds(15,90,64,64);
        frame.getContentPane().add(label);
        
        JLabel label1 = new JLabel("");
        Image img1 = new ImageIcon(Objects.requireNonNull(this.getClass().getResource("/Students.png"))).getImage();
        label1.setIcon(new ImageIcon(img1));
        label1.setBounds(15,180,64,64);
        frame.getContentPane().add(label1);
        
        JLabel label2 = new JLabel("");
        Image img2 = new ImageIcon(Objects.requireNonNull(this.getClass().getResource("/Students.png"))).getImage();
        label2.setIcon(new ImageIcon(img2));
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
