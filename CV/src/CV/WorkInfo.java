package CV;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class WorkInfo {
	protected Component btk() {
		JLabel label = new JLabel(
				"<html>�� 10.10.2011�. � ��� �������<br/>��������� ������������������ �������� - ���<br/>��. �����, ���. ������������ ���� 115�<br/>���������� ��������<br/>"
						+ "�����������, ��������� � ���������� �� ��������<br/>��������� �� ������/�������� ������/��������� ����� �� ������<br/>�� 01.12.2014�. ��� ������� � �������� ������ ����������<br/>�� 10.10.2011�. �� 30.11.2014�. - �������� ����������<html>");
		label.setBounds(20, 40, 460, 250);
		label.setFont(new Font(null, Font.PLAIN, 12));
		return label;
	}

	protected Component cable() {
		JLabel label = new JLabel(
				"<html>�� 17.08.2009�. � �� 19.07.2011�.<br/>������ ���� ���<br/>��. ��������� ��. ������� ���������� 28<br/>������������ ����� � �����������<br/>1.02.2011�. � 19.07.2011�. -  ���������� �����������<br/>13.09.2010�.  - 31.01.2011�. - ��������� ���������� �����������<br/>17.08.2009�. - 12.09.2010�. - �������� ���������� (������)<html>");
		label.setBounds(20, 190, 460, 250);
		label.setFont(new Font(null, Font.PLAIN, 12));
		return label;
	}
}
