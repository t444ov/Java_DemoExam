package com.t444ov.DemoExam3.Manager;

import com.t444ov.DemoExam3.App;
import com.t444ov.DemoExam3.Entity.ClientEntity;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClientEntityManager {
    public static void insert(ClientEntity client) throws SQLException {
        try (Connection c = App.getConnection()) {
            String sql = "insert into client(FirstName, LastName, Patronymic, Birthday, RegistrationDate, Email, Phone, GenderCode, PhotoPath) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = c.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, client.getFirstName());
            ps.setString(2, client.getLastName());
            ps.setString(3, client.getPatronymic());
            ps.setTimestamp(4, new Timestamp(client.getBirthday().getTime()));
            ps.setTimestamp(5, new Timestamp(client.getRegistrationDate().getTime()));
            ps.setString(6, client.getEmail());
            ps.setString(7, client.getPhone());
            ps.setString(8, String.valueOf(client.getGenderCode()));
            ps.setString(9, client.getPhotoPath());
            ps.executeUpdate();

            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) {
                client.setID(keys.getInt(1));
                return;
            } throw new SQLException("Entity not added!");
        }
    }

    public static ClientEntity selectByID(int ID) throws SQLException {
        try (Connection c = App.getConnection()) {
            String sql = "select * from client where ID=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, ID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                new ClientEntity(
                        rs.getInt("ID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Patronymic"),
                        rs.getTimestamp("Birthday"),
                        rs.getTimestamp("RegistrationDate"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("GenderCode").charAt(0),
                        rs.getString("PhotoPath")
                );
            } return null;
        }
    }

    public static List<ClientEntity> selectAll() throws SQLException {
        try (Connection c = App.getConnection()) {
            String sql = "select * from client";
            Statement s = c.createStatement();
            ResultSet rs = s.executeQuery(sql);

            List<ClientEntity> list = new ArrayList<>();
            while (rs.next()) {
                list.add(new ClientEntity(
                        rs.getInt("ID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Patronymic"),
                        rs.getTimestamp("Birthday"),
                        rs.getTimestamp("RegistrationDate"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("GenderCode").charAt(0),
                        rs.getString("PhotoPath")
                ));
            } return list;
        }
    }

    public static void update(ClientEntity client) throws SQLException {
        try (Connection c = App.getConnection()) {
            String sql = "update client set FirstName=?, LastName=?, Patronymic=?, Birthday=?, RegistrationDate=?, Email=?, Phone=?, GenderCode=?, PhotoPath=? where ID=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, client.getFirstName());
            ps.setString(2, client.getLastName());
            ps.setString(3, client.getPatronymic());
            ps.setTimestamp(4, new Timestamp(client.getBirthday().getTime()));
            ps.setTimestamp(5, new Timestamp(client.getRegistrationDate().getTime()));
            ps.setString(6, client.getEmail());
            ps.setString(7, client.getPhone());
            ps.setString(8, String.valueOf(client.getGenderCode()));
            ps.setString(9, client.getPhotoPath());
            ps.setInt(10, client.getID());
            ps.executeUpdate();
        }
    }

    public static void delete(int ID) throws SQLException {
        try (Connection c = App.getConnection()) {
            String sql = "delete from client where ID=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, ID);
            ps.executeUpdate();
        }
    }

    public static void delete(ClientEntity client) throws SQLException {
        try (Connection c = App.getConnection()) {
            delete(client.getID());
        }
    }
}
