package CV;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Work {
	protected void showWindow() {

		JFrame frame = new JFrame("CV Иван Темелков - Трудов стаж");

		frame.setBounds(200, 200, 480, 450);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		frame.setResizable(false);
		frame.setLocationRelativeTo(null);

		WorkInfo info = new WorkInfo();
		frame.add(info.btk());
		frame.add(info.cable());

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
