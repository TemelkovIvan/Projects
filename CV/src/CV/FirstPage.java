package CV;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Objects;

public class FirstPage {
	protected void showWindow() {

		JFrame frame = new JFrame("CV Иван Темелков");
		JLabel label = new JLabel("Автобиография на Иван Темелков");
		label.setBounds(30, 15, 420, 50);
		label.setFont(new Font(null, Font.PLAIN, 25));

		frame.add(label);

		frame.setBounds(200, 200, 480, 450);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		frame.setResizable(false);
		frame.setLocationRelativeTo(null);


		
		JButton windowOne = new JButton("Име / Адрес / Телефон / e-mail / дата на раждане");
		windowOne.setBounds(10, 85, 445, 50);
		frame.getContentPane().add(windowOne);
		windowOne.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				frame.setVisible(false);
				PersonalData w2 = new PersonalData();
				w2.showWindow();
			}
		});

		JButton windowTwo = new JButton("Образование");
		windowTwo.setBounds(10, 165, 445, 50);
		frame.getContentPane().add(windowTwo);
		windowTwo.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				frame.setVisible(false);
				Education education = new Education();
				education.showWindow();
			}
		});

		JButton windowThree = new JButton("Трудов стаж");
		windowThree.setBounds(10, 245, 445, 50);
		frame.getContentPane().add(windowThree);
		windowThree.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				frame.setVisible(false);
				Work work = new Work();
				work.showWindow();
			}
		});

		JButton windowFive = new JButton("Умения");
		windowFive.setBounds(10, 325, 445, 50);
		frame.getContentPane().add(windowFive);
		windowFive.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				frame.setVisible(false);
				Skills skills = new Skills();
				skills.showWindow();
			}
		});

		frame.setVisible(true);

	}
}
