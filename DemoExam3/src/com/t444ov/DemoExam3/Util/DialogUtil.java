package com.t444ov.DemoExam3.Util;

import javax.swing.*;
import java.awt.*;

public class DialogUtil extends JOptionPane {
    public static void showError(Component parentComponent, String message) {
        JOptionPane.showMessageDialog(parentComponent, message, "Ошибка", JOptionPane.ERROR_MESSAGE);
    }

    public static void showError(String message) {
        showError(null, message);
    }

    public static void showInfo(Component parentComponent, String message) {
        JOptionPane.showMessageDialog(parentComponent, message, "Информация", JOptionPane.INFORMATION_MESSAGE);
    }

    public static void showInfo(String message) {
        showInfo(null, message);
    }
}
