/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author pc
 */
public class AccountDAO extends DBContext {

    public boolean isExisted(String username) {
        String sql = "select * from [dbo].[Account] where Username = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String user = rs.getString("Username");
                if (user != null) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public Account getAccountByUsername(String username) {
        Account a = null;
        String sql = "select * from [dbo].[Account] where username = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {

                String fullname = rs.getString("username");
                String password = rs.getString("password");
                String createdate = rs.getString("created_date");
                boolean status = rs.getBoolean("status");
                String role = rs.getString("role");
                boolean online = rs.getBoolean("online");
                a = new Account(username, password, role, createdate, status, online);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return a;
    }

    public List<Account> getAll() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String createddate = rs.getString("created_date");
                boolean status = rs.getBoolean("status");
                String role = rs.getString("role");
                boolean online = rs.getBoolean("online");
                list.add(new Account(username, password, role, createddate, status, online));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertAccount(Account a) {
        String sql = "insert into Account(username,[password],created_date,[status],[role])\n"
                + "values(?,?,?,1,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setString(3, a.getCreated_date());
            st.setString(4, a.getRole());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void update(Account a) {

        String sql = "UPDATE Account\n"
                + "SET password = ? where username=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, a.getPassword());
            pre.setString(2, a.getUsername());

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void changeStatus(Account a) {

        String sql = "UPDATE Account\n"
                + "SET status = ? where username=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, !a.isIsActived());
            pre.setString(2, a.getUsername());

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void online(Account a) {

        String sql = "UPDATE Account\n"
                + "SET online = ? where username=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, true);
            pre.setString(2, a.getUsername());

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }
    public void offline(Account a) {

        String sql = "UPDATE Account\n"
                + "SET online = ? where username=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, false);
            pre.setString(2, a.getUsername());

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public List<Account> searchByNameAccount(String txtSearch) {
        List<Account> list = new ArrayList<>();
        //  if(txtSearch != null || !txtSearch.equals(""))
        String sql = "select top 5 * from Account\n"
                + "where [username] like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("role"),
                        rs.getString("created_date"),
                        rs.getBoolean("status"), rs.getBoolean("online")
                ));
                ;
            }
        } catch (Exception e) {
        }
        return list;

    }

    public void updateRole(String role, String username) {
        String sql = "UPDATE Account\n"
                + "SET role = ? where username=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, role);
            pre.setString(2, username);

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //thong ke
    public Map<String, Integer> countNumUserJoin() {
        Map<String, Integer> countNumUserJoin = new LinkedHashMap<>();

        // Sử dụng LocalDate để lấy ngày hiện tại
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM");

        // Tạo danh sách 6 tháng gần nhất, bao gồm tháng hiện tại
        String[] months = new String[6];
        for (int i = 5; i >= 0; i--) {
            LocalDate date = currentDate.minusMonths(i);
            months[5 - i] = date.format(formatter);
            countNumUserJoin.put(months[5 - i], 0); // Khởi tạo giá trị là 0
        }

        String sql = "SELECT \n"
                + "    FORMAT(created_date, 'MM') AS thang,\n"
                + "    COUNT(*) AS so_nguoi_dang_ky\n"
                + "FROM account\n"
                + "WHERE created_date >= DATEADD(MONTH, -5, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1))\n"
                + "  AND created_date < DATEADD(MONTH, 1, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1))\n"
                + "GROUP BY FORMAT(created_date, 'MM')\n"
                + "ORDER BY thang;";

        try (PreparedStatement pre = connection.prepareStatement(sql); ResultSet rs = pre.executeQuery()) {

            // Xử lý kết quả truy vấn
            while (rs.next()) {
                String month = rs.getString("thang");
                int count = rs.getInt("so_nguoi_dang_ky");
                if (countNumUserJoin.containsKey(month)) {
                    countNumUserJoin.put(month, count);
                }
            }

            return countNumUserJoin;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        AccountDAO adao = new AccountDAO();
        Map<String, Integer> numberOfUser = new AccountDAO().countNumUserJoin();
        if (numberOfUser != null) {
        for (Map.Entry<String, Integer> entry : numberOfUser.entrySet()) {
            System.out.println("Tháng " + entry.getKey() + ": " + entry.getValue() + " người đăng ký");
        }
    }
    }
}
