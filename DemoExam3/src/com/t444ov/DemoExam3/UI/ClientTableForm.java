package com.t444ov.DemoExam3.UI;

import com.t444ov.DemoExam3.Entity.ClientEntity;
import com.t444ov.DemoExam3.Manager.ClientEntityManager;
import com.t444ov.DemoExam3.Util.BaseForm;
import com.t444ov.DemoExam3.Util.CustomTableModel;

import javax.swing.*;
import javax.swing.table.TableColumn;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.SQLException;
import java.util.*;

public class ClientTableForm extends BaseForm {
    private JTable table;
    private JComboBox<String> genderCodeFilterBox;
    private JComboBox<String> firstNameFilterBox;
    private JButton clearFiltersButton;
    private JButton IDSortButton;
    private JButton birthdaySortButton;
    private JButton addButton;
    private JPanel mainPanel;
    private JLabel rowCountLabel;

    private CustomTableModel<ClientEntity> model;

    private boolean IDSort = true;
    private boolean birthdaySort = false;

    public ClientTableForm() {
        super(800,600);
        setContentPane(mainPanel);
        initTable();
        initBoxes();
        initButtons();
        setVisible(true);
    }

    public void initTable() {
        table.getTableHeader().setReorderingAllowed(false);
        table.setRowHeight(50);
        try {
            model = new CustomTableModel<>(
                    ClientEntity.class,
                    new String[] {"ID","Имя", "Фамилия", "Отчество", "Дата рождения", "Дата регистрации", "Email", "Контактный телефон", "Пол", "Путь до картинки", "Картинка"},
                    ClientEntityManager.selectAll()
            );
            table.setModel(model);

            TableColumn column = table.getColumn("Путь до картинки");
            column.setMinWidth(0);
            column.setPreferredWidth(0);
            column.setMaxWidth(0);

            updateRowCountLabel(model.getRows().size(), model.getRows().size());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        table.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                if (e.getClickCount() == 2) {
                    int row = table.rowAtPoint(e.getPoint());
                    if (row != -1) {
                        dispose();
                        new ClientEditForm(model.getRows().get(row));
                    }
                }
            }
        });
    }

    public void initBoxes() {
        genderCodeFilterBox.addItem("Все");
        genderCodeFilterBox.addItem("Мужской");
        genderCodeFilterBox.addItem("Женский");

        genderCodeFilterBox.addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                if (e.getStateChange() == ItemEvent.SELECTED) {
                    applyFilters();
                }
            }
        });

        firstNameFilterBox.addItem("Все");
        try {
            List<ClientEntity> list = ClientEntityManager.selectAll();
            Set<String> firstNames = new HashSet<>();
            for (ClientEntity c : list) {
                firstNames.add(c.getFirstName());
            } for (String s : firstNames) {
                firstNameFilterBox.addItem(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        firstNameFilterBox.addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                if (e.getStateChange() == ItemEvent.SELECTED) {
                    applyFilters();
                }
            }
        });
    }

    public void applyFilters() {
        try {
            List<ClientEntity> list = ClientEntityManager.selectAll();
            int max = list.size();
            int index = genderCodeFilterBox.getSelectedIndex();

            if (index == 1) {
                list.removeIf(client -> client.getGenderCode() != 'м');
            } else if (index == 2) {
                list.removeIf(client -> client.getGenderCode() != 'ж');
            }

            if (firstNameFilterBox.getSelectedIndex() != 0) {
                list.removeIf(client -> !client.getFirstName().equals(firstNameFilterBox.getSelectedItem()));
            }

            model.setRows(list);
            model.fireTableDataChanged();

            IDSort = true;
            birthdaySort = false;

            updateRowCountLabel(list.size(), max);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void initButtons() {
        addButton.addActionListener(e -> {
            dispose();
            new ClientCreateForm();
        });

        clearFiltersButton.addActionListener(e -> {
            genderCodeFilterBox.setSelectedIndex(0);
            firstNameFilterBox.setSelectedIndex(0);
        });

        IDSortButton.addActionListener(e -> {
            Collections.sort(model.getRows(), new Comparator<ClientEntity>() {
                @Override
                public int compare(ClientEntity o1, ClientEntity o2) {
                    if (IDSort) {
                        return Integer.compare(o2.getID(), o1.getID());
                    } else {
                        return Integer.compare(o1.getID(), o2.getID());
                    }
                }
            });
            IDSort = !IDSort;
            birthdaySort = false;
            model.fireTableDataChanged();
        });

        birthdaySortButton.addActionListener(e -> {
            Collections.sort(model.getRows(), new Comparator<ClientEntity>() {
                @Override
                public int compare(ClientEntity o1, ClientEntity o2) {
                    if (birthdaySort) {
                        return o2.getBirthday().compareTo(o1.getBirthday());
                    } else {
                        return o1.getBirthday().compareTo(o2.getBirthday());
                    }
                }
            });
            birthdaySort = !birthdaySort;
            IDSort = false;
            model.fireTableDataChanged();
        });
    }

    private void updateRowCountLabel(int actual, int max) {
        rowCountLabel.setText("Отображено записей: " + actual + " / " + max);
    }
 }
