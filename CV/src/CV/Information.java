package CV;

import javax.swing.*;
import java.awt.*;

public class Information {
	protected Component name() {
		JLabel label = new JLabel("���: ���� �������� ��������", SwingConstants.CENTER);
		label.setBounds(0, 90, 460, 50);
		label.setFont(new Font(null, Font.PLAIN, 18));
		return label;
	}

	protected Component address() {
		JLabel label = new JLabel("�����: ��. �����, �.�. ������, ��. 291, ��. �, ��. 4", SwingConstants.CENTER);
		label.setBounds(0, 140, 460, 50);
		label.setFont(new Font(null, Font.PLAIN, 18));
		return label;
	}

	protected Component phone() {
		JLabel label = new JLabel("������� �� �������: 0877766276", SwingConstants.CENTER);
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
		JLabel label = new JLabel("����� �� 28.05.1986 ������", SwingConstants.CENTER);
		label.setBounds(0, 290, 460, 50);
		label.setFont(new Font(null, Font.PLAIN, 18));
		return label;
	}

	protected Component city() {
		JLabel label = new JLabel("� ���� ���������", SwingConstants.CENTER);
		label.setBounds(0, 340, 460, 50);
		label.setFont(new Font(null, Font.PLAIN, 18));
		return label;
	}
}
