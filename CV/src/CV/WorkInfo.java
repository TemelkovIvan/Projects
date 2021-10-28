package CV;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class WorkInfo {
	protected Component btk() {
		JLabel label = new JLabel(
				"<html>От 10.10.2011г. – към момента<br/>Българска Телекомуникационна Компания - ЕАД<br/>гр. София, бул. „Цариградско шосе” 115И<br/>Техническа дирекция<br/>"
						+ "Архитектура, планиране и изграждане на мрежата”<br/>Планиране на пренос/Фиксиран достъп/Фиксирана мрежа за достъп<br/>От 01.12.2014г. към момента – длъжност Старши специалист<br/>От 10.10.2011г. до 30.11.2014г. - длъжност Специалист<html>");
		label.setBounds(20, 40, 460, 250);
		label.setFont(new Font(null, Font.PLAIN, 12));
		return label;
	}

	protected Component cable() {
		JLabel label = new JLabel(
				"<html>От 17.08.2009г. – до 19.07.2011г.<br/>КЕЙБЪЛ ГРУП ООД<br/>гр. Пазарджик ул. „Гаврил Кръстевич” 28<br/>Електрически мрежи и Комуникации<br/>1.02.2011г. – 19.07.2011г. -  технически ръководител<br/>13.09.2010г.  - 31.01.2011г. - заместник технически ръководител<br/>17.08.2009г. - 12.09.2010г. - работник инсталации (техник)<html>");
		label.setBounds(20, 190, 460, 250);
		label.setFont(new Font(null, Font.PLAIN, 12));
		return label;
	}
}
