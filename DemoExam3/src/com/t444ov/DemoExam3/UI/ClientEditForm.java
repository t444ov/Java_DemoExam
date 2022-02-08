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

public class ClientEditForm extends BaseForm {
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
    private JButton deleteButton;
    private JButton saveButton;
    private JTextField IDField;

    private ClientEntity client;

    public ClientEditForm(ClientEntity client) {
        super(800,600);
        this.client = client;
        setContentPane(mainPanel);
        initBoxes();
        initFields();
        initButtons();
        setVisible(true);
    }

    public void initBoxes() {
        genderCodeBox.addItem("Мужской");
        genderCodeBox.addItem("Женский");
    }

    public void initFields() {
        IDField.setEditable(false);
        IDField.setText(String.valueOf(client.getID()));
        firstNameField.setText(client.getFirstName());
        lastNameField.setText(client.getLastName());
        patronymicField.setText(client.getPatronymic());
        birthdayField.setText(App.DATE_FORMAT.format(client.getBirthday()));
        registrationDateField.setText(App.DATE_FORMAT.format(client.getRegistrationDate()));
        emailField.setText(client.getEmail());
        phoneField.setText(client.getPhone());
        genderCodeBox.setSelectedItem(client.getGenderCode() == 'м' ? "Мужской" : "Женский");
        photoPathField.setText(client.getPhotoPath());
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

            Date registrationDate = null;
            try {
                registrationDate = App.DATE_FORMAT.parse(registrationDateField.getText());
            } catch (ParseException ex) {
                DialogUtil.showError(this,"Дата регистрации не введена или введена некорректно. \nПример заполнения: гггг-мм-дд");
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

            client.setFirstName(firstName);
            client.setLastName(lastName);
            client.setPatronymic(patronymic);
            client.setBirthday(birthday);
            client.setRegistrationDate(registrationDate);
            client.setEmail(email);
            client.setPhone(phone);
            client.setGenderCode(genderCode);
            client.setPhotoPath(photoPath);

            try {
                ClientEntityManager.update(client);
                DialogUtil.showInfo(this,"Клиент успешно отредактирован");
                dispose();
                new ClientTableForm();
            } catch (SQLException ex) {
                DialogUtil.showError(this,"ошибка сохранения данных: \n" + ex.getMessage());
                return;
            }
        });

        deleteButton.addActionListener(e -> {
            if (JOptionPane.showConfirmDialog(this,"Вы точно хотите удалить данную запись?","Подтверждение удаления записи",JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION) {
                try {
                    ClientEntityManager.delete(client);
                    DialogUtil.showInfo(this,"Клиент успешно удален");
                    dispose();
                    new ClientTableForm();
                } catch (SQLException ex) {
                    DialogUtil.showError(this,"Ошибка удаления данных: \n" + ex.getMessage());
                    return;
                }
            }
        });

        backButton.addActionListener(e -> {
            dispose();
            new ClientTableForm();
        });
    }
}
