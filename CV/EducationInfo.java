package CV;

import javax.swing.*;
import java.awt.*;

public class EducationInfo {
    protected Component master() {
        JLabel label = new JLabel("<html>Технически Университет - СОФИЯ<br/>Висше образование - Магистър<br/>специалност „Телекомуникации”, „Радиокомуницкации“<br/>/2013 - 2015/<html>");
        label.setBounds(100, 90, 500, 70);
        label.setFont(new Font(null, Font.PLAIN, 12));
        return label;
    }
    protected Component bachelor() {
        JLabel label = new JLabel("<html>Технически Университет - ВАРНА<br/>Висше образование - Бакалавър<br/>специалност „Комуникационна техника и технологии”<br/>/2005 - 2009/<html>");
        label.setBounds(100, 180, 500, 70);
        label.setFont(new Font(null, Font.PLAIN, 12));
        return label;
    }
    protected Component secondary() {
        JLabel label = new JLabel("<html>СОУ Георги Бенковски<br/>Средно образование<br/>гр. Пазарджик<html>");
        label.setBounds(100, 270, 500, 50);
        label.setFont(new Font(null, Font.PLAIN, 12));
        return label;
    }
}
