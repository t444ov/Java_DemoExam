package com.t444ov.DemoExam3.UI;

import com.t444ov.DemoExam3.App;
import com.t444ov.DemoExam3.Entity.ClientEntity;
import com.t444ov.DemoExam3.Manager.ClientEntityManager;
import com.t444ov.DemoExam3.Util.BaseForm;
import com.t444ov.DemoExam3.Util.DialogUtil;

import javax.swing.*;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;

public class ClientCreateForm extends BaseForm {
    private JPanel mainPanel;
    private JTextField firstNameField;
    private JTextField lastNameField;
    private JTextField patronymicField;
    private JTextField birthdayField;
    private JTextField registrationDateField;
    private JTextField emailField;
    private JTextField phoneField;
    private JComboBox<String> genderCodeBox;
    private JTextField photoPathField;
    private JButton backButton;
    private JButton saveButton;

    public ClientCreateForm() {
        super(800, 600);
        setContentPane(mainPanel);
        initBoxes();
        initButtons();
        setVisible(true);
    }

    public void initBoxes() {
        genderCodeBox.addItem("Мужской");
        genderCodeBox.addItem("Женский");
    }

    public void initButtons() {
        saveButton.addActionListener(e -> {
            String firstName = firstNameField.getText();
            if (firstName.isEmpty()) {
                DialogUtil.showError(this,"Имя не введено");
                return;
            } if (firstName.length() > 50) {
                DialogUtil.showError(this,"Имя слишком длинное");
                return;
            }

            String lastName = lastNameField.getText();
            if (lastName.isEmpty()) {
                DialogUtil.showError(this,"Фамилия не введена");
                return;
            } if (lastName.length() > 50) {
                DialogUtil.showError(this, "Фамилия слишком длинная");
                return;
            }

            String patronymic = patronymicField.getText();
            if (patronymic.isEmpty()) {
                DialogUtil.showError(this,"Отчество не введено");
                return;
            } if (patronymic.length() > 50) {
                DialogUtil.showError(this,"Отчество слишком длинное");
                return;
            }

            Date birthday = null;
            try {
                birthday = App.DATE_FORMAT.parse(birthdayField.getText());
            } catch (ParseException ex) {
                DialogUtil.showError(this,"Дата рождения не введена или введена некорректно. \nПример заполнения: гггг-мм-дд");
                return;
            }

            registrationDateField.setEditable(false);

            String email = emailField.getText();
            if (email.isEmpty()) {
                DialogUtil.showError(this,"Email не введен");
                return;
            } if (email.length() > 255) {
                DialogUtil.showError(this,"Email слишком длинный");
                return;
            }

            String phone = phoneField.getText();
            if (phone.isEmpty()) {
                DialogUtil.showError(this,"Контактный телефон не введен");
                return;
            } if (phone.length() > 20) {
                DialogUtil.showError(this,"Контактный телефон слишком длинный");
                return;
            }
            char genderCode = genderCodeBox.getSelectedItem() == "Мужской" ? 'м' : 'ж';

            String photoPath = photoPathField.getText();

            ClientEntity client = new ClientEntity(
                    firstName,
                    lastName,
                    patronymic,
                    birthday,
                    new Date(),
                    email,
                    phone,
                    genderCode,
                    photoPath
            );

            try {
                ClientEntityManager.insert(client);
                System.out.println(client);
                DialogUtil.showInfo(this,"Клиент успешно добавлен");
                dispose();
                new ClientTableForm();
            } catch (SQLException ex) {
                DialogUtil.showError(this,"Ошибка сохранения данных: \n" + ex.getMessage());
                return;
            }
        });

        backButton.addActionListener(e -> {
            dispose();
            new ClientTableForm();
        });
    }
}
