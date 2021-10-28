package CV;

import javax.swing.*;
import java.awt.*;

public class Information {
	protected Component name() {
		JLabel label = new JLabel("Име: Иван Георгиев Темелков", SwingConstants.CENTER);
		label.setBounds(0, 90, 460, 50);
		label.setFont(new Font(null, Font.PLAIN, 18));
		return label;
	}

	protected Component address() {
		JLabel label = new JLabel("Адрес: Гр. София, ж.к. Дружба, бл. 291, вх. Г, ет. 4", SwingConstants.CENTER);
		label.setBounds(0, 140, 460, 50);
		label.setFont(new Font(null, Font.PLAIN, 18));
		return label;
	}

	protected Component phone() {
		JLabel label = new JLabel("Телефон за контакт: 0877766276", SwingConstants.CENTER);
		label.setBounds(0, 190, 460, 50);
		label.setFont(new Font(null, Font.PLAIN, 18));
		return label;
	}

	protected Component mail() {
		JLabel label = new JLabel("e-mail: ivan_temelkow@abv.bg", SwingConstants.CENTER);
		label.setForeground(Color.BLUE);
		label.setBounds(0, 240, 460, 50);
		label.setFont(new Font(null, Font.PLAIN, 18));
		return label;
	}

	protected Component birthDay() {
		JLabel label = new JLabel("Роден на 28.05.1986 година", SwingConstants.CENTER);
		label.setBounds(0, 290, 460, 50);
		label.setFont(new Font(null, Font.PLAIN, 18));
		return label;
	}

	protected Component city() {
		JLabel label = new JLabel("В град Пазарджик", SwingConstants.CENTER);
		label.setBounds(0, 340, 460, 50);
		label.setFont(new Font(null, Font.PLAIN, 18));
		return label;
	}
}
