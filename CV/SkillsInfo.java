package CV;

import javax.swing.*;
import java.awt.*;

public class SkillsInfo {
    protected Component office() {
        JLabel label = new JLabel("<html>MS Office - Long experience<br/>/Word, Excel, Power Point, Outlook, Visio/<br/>COURSES<br/>- Excel – Tips and tricks<br/>- Excel 2016 Part 2<br/>- Excel 2016 Programming with VBA<html>");
        label.setBounds(20, 60, 460, 150);
        label.setFont(new Font(null, Font.PLAIN, 12));
        return label;
    }
    protected Component java() {
        JLabel label = new JLabel("<html>JAVA - Self-study<br/>I am familiar with variables, methods, classes, objects, loops, arrays, OOP<br/>(Abstraction, Inheritance, Encapsulation, Polymorphism)<html>");
        label.setBounds(20, 160, 460, 150);
        label.setFont(new Font(null, Font.PLAIN, 12));
        return label;
    }

    protected Component other() {
        JLabel label = new JLabel("<html>Умения за работя в екип, придобити в работата ми в Студентски съвет<br/>към ТУ – Варна. Добро ниво на комуникативност; информираност;<br/>деловитост; принципност; коректност; почтеност; лоялност<html>");
        label.setBounds(20, 240, 460, 150);
        label.setFont(new Font(null, Font.PLAIN, 12));
        return label;
    }




}
