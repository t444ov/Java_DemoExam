package com.t444ov.DemoExam3.Entity;

import lombok.Data;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.io.IOException;
import java.util.Date;

@Data
public class ClientEntity {
    private int ID;
    private String firstName;
    private String lastName;
    private String patronymic;
    private Date birthday;
    private Date registrationDate;
    private String email;
    private String phone;
    private char genderCode;
    private String photoPath;

    private ImageIcon photo;

    public ClientEntity(int ID, String firstName, String lastName, String patronymic, Date birthday, Date registrationDate, String email, String phone, char genderCode, String photoPath) {
        this.ID = ID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.patronymic = patronymic;
        this.birthday = birthday;
        this.registrationDate = registrationDate;
        this.email = email;
        this.phone = phone;
        this.genderCode = genderCode;
        this.photoPath = photoPath;

        try {
            this.photo = new ImageIcon(
                    ImageIO.read(ClientEntity.class.getClassLoader().getResource(photoPath))
                            .getScaledInstance(50,50, Image.SCALE_DEFAULT)
            );
        } catch (Exception e) {
//            e.printStackTrace();
        }
    }

    public ClientEntity(String firstName, String lastName, String patronymic, Date birthday, Date registrationDate, String email, String phone, char genderCode, String photoPath) {
        this(-1, firstName, lastName, patronymic, birthday, registrationDate, email, phone, genderCode, photoPath);
    }
}
