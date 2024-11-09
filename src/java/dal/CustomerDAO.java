/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Account;
import Model.Bag;
import Model.Customer;
import Model.Membership;
import Model.Notification;
import Model.Orders;
import Model.OrdersDetail;
import Model.Product;
import Model.TransactionHistory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import jdk.jfr.Timestamp;

/**
 *
 * @author thang
 */
public class CustomerDAO extends DBContext {
    
    public void updatePassword(String username, String password) {
        String sql = "UPDATE Account\n"
                + "   SET [password] = ?\n"
                + " WHERE [username] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, username);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertCustomer(Customer a, String username) {
        String sql = "insert into customer(full_name,email,phone_number,[address],username,nickname)\n"
                + "values (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getFullName());
            st.setString(2, a.getEmail());
            st.setString(3, a.getPhone());
            st.setString(4, a.getAddress());
            st.setString(5, username);
            st.setString(6, a.getNickName());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);

        }

    }

    public Customer getCustomerByUsername(String username) {
        Customer c = new Customer();
        String sql = "select * from [dbo].[Customer] where username = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("full_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                String nickname = rs.getString("nickname");
                int point = rs.getInt("point");
                c = new Customer(id, fullname, email, phone, address, nickname, point);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return c;
    }

    public Customer getCustomerById(int id) {
        Customer c = new Customer();
        String sql = "select * from [dbo].[Customer] c\n"
                + "join account a\n"
                + "on c.username=a.username\n"
                + "where id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String fullname = rs.getString("full_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                int point = rs.getInt("point");
                String username = rs.getString("username");
                String nickname = rs.getString("nickname");
                String password = rs.getString("password");
                String created_date = rs.getString("created_date");
                boolean status = rs.getBoolean("status");
                boolean isOnline = rs.getBoolean("online");
                String role = rs.getString("role");
                c = new Customer(id, fullname, nickname, email, phone, address, point, username, role, created_date, status, isOnline);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return c;
    }

    public boolean isNickNameExisted(String nickname) {
        String sql = "select * from [dbo].[customer] where nickname = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, nickname);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                Integer id = rs.getInt("id");
                if (id != null) {
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

    public List<Customer> getCustomerByKeyword(Account a, String key) {
        List<Customer> list = new ArrayList<Customer>();
        CustomerDAO cdao = new CustomerDAO();
        Customer cus = cdao.getCustomerByUsername(a.getUsername());

        String sql = "select * from [dbo].[Customer] where nickname like ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + key + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("full_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                String nickname = rs.getString("nickname");
                int point = rs.getInt("point");
                Customer c = new Customer(id, fullname, email, phone, address, nickname, point);
                if (!cus.getNickName().equals(nickname) && !cdao.checkFriend(cus.getId(), id)) {
                    list.add(c);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void update(Customer c) {

        String sql = "UPDATE customer\n"
                + "SET full_name = ?,email=?,phone_number=?,address=?,nickname=? where id=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, c.getFullName());
            pre.setString(2, c.getEmail());
            pre.setString(3, c.getPhone());
            pre.setString(4, c.getAddress());
            pre.setString(5, c.getNickName());
            pre.setInt(6, c.getId());
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void addFriendRequest(int from, int to) {
        String sql = "insert into friendrequest values(?,?)";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, from);
            pre.setInt(2, to);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteFriendRequest(int from, int to) {
        String sql = "delete from friendrequest where senderid=? and receiverid=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, from);
            pre.setInt(2, to);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int checkRequestExisted(int from, int to) {
        String sql = "select * from [dbo].[friendrequest] where senderid = ? and receiverid=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, from);
            pre.setInt(2, to);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        String sql2 = "select * from [dbo].[friendrequest] where senderid = ? and receiverid=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql2);
            pre.setInt(2, from);
            pre.setInt(1, to);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return -1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public boolean checkFriend(int from, int to) {
        String sql = "select * from [dbo].[friend] where customerid = ? and friendid=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, from);
            pre.setInt(2, to);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public void addFriend(int from, int to) {
        String sql = "insert into friend values(?,?)";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, from);
            pre.setInt(2, to);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        String sql2 = "insert into friend values(?,?)";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql2);
            pre.setInt(2, from);
            pre.setInt(1, to);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteFriend(int from, int to) {
        String sql = "delete from friend where customerid=? and friendid=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, from);
            pre.setInt(2, to);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        String sql2 = "delete from friend where customerid=? and friendid=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql2);
            pre.setInt(2, from);
            pre.setInt(1, to);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Customer> getFriendOnline(int userid) {
        List<Customer> list = new ArrayList<Customer>();
        String sql = "select c2.id,c2.full_name,c2.email,c2.phone_number,c2.address,c2.nickname,c2.point"
                + " from Account a,customer c1,customer c2,friend "
                + "f where f.customerid=c1.id and f.friendid=c2.id and a.username=c2.username "
                + "and a.online=1 and c1.id=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, userid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("full_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                String nickname = rs.getString("nickname");
                int point = rs.getInt("point");
                Customer c = new Customer(id, fullname, email, phone, address, nickname, point);
                list.add(c);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Customer> getFriendOffline(int userid) {
        List<Customer> list = new ArrayList<Customer>();
        String sql = "select c2.id,c2.full_name,c2.email,c2.phone_number,c2.address,c2.nickname,c2.point"
                + " from Account a,customer c1,customer c2,friend "
                + "f where f.customerid=c1.id and f.friendid=c2.id and a.username=c2.username "
                + "and a.online=0 and c1.id=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, userid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("full_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                String nickname = rs.getString("nickname");
                int point = rs.getInt("point");
                Customer c = new Customer(id, fullname, email, phone, address, nickname, point);
                list.add(c);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Customer> getFriendRequest(int userid) {
        List<Customer> list = new ArrayList<Customer>();
        String sql = "select c1.id,c1.full_name,c1.email,c1.phone_number,c1.address,c1.nickname,c1.point "
                + "from customer c1,customer c2,friendrequest f \n"
                + "where f.senderid=c1.id and f.receiverid=c2.id  and c2.id=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, userid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("full_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                String nickname = rs.getString("nickname");
                int point = rs.getInt("point");
                Customer c = new Customer(id, fullname, email, phone, address, nickname, point);
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void updatePoint(int point, int id) {
        String sql = "UPDATE customer\n"
                + "SET point = point + ? "
                + "WHERE id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, point);
            pre.setInt(2, id);

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void buyMembership(int id, int type) {
        String sql = "insert into membershipdetail\n"
                + " values(?,?,?,?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, type);
            pre.setInt(2, id);
            if (type == 1) {
                pre.setTimestamp(3, java.sql.Timestamp.valueOf(getFormatDate(LocalDateTime.now().plusMonths(1))));
            } else if (type == 2) {
                pre.setTimestamp(3, java.sql.Timestamp.valueOf(getFormatDate(LocalDateTime.now().plusMonths(6))));
            } else if (type == 3) {
                pre.setTimestamp(3, java.sql.Timestamp.valueOf(getFormatDate(LocalDateTime.now().plusMonths(12))));
            }
            pre.setString(4, "active");

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public String getFormatDate(LocalDateTime date) {
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return pattern.format(date);
    }

    public void transactionHistory(int id, int amount, String type) {
        String sql = "insert into historypayment\n"
                + " values(?,?,?,?)";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.setTimestamp(2, getCurrentTimestamp());
            pre.setInt(3, amount);
            pre.setString(4, type);

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<TransactionHistory> getHistory(int id, Date from, Date to, String type) {
        List<TransactionHistory> list = new ArrayList<>();
        String sql = "select * from historypayment where customerid = ?";
        if (from != null) {
            sql += " and date >='" + from + "'";
        }
        if (to != null) {
            sql += " and date <='" + to + "'";
        }
        if (!type.equals("0")) {
            sql += " and type = '" + type + "'";
        }
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new TransactionHistory(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<TransactionHistory> getHistory(int id, Date from, Date to) {
        List<TransactionHistory> list = new ArrayList<>();
        String sql = "select * from historypayment where customerid = ?";
        if (from != null) {
            sql += " and date >='" + from + "'";
        }
        if (to != null) {
            sql += " and date <='" + to + "'";
        }
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new TransactionHistory(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertNotify(int cid, String mess) {
        String sql = "Insert into notifications values(?,?,0,?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cid);
            pre.setString(2, mess);
            pre.setTimestamp(3, getCurrentTimestamp());
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Notification> getNotification(int id) {
        List<Notification> list = new ArrayList<>();
        String sql = "select * from notifications where customerid = ? order by id desc";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Notification(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4), rs.getString(5)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Notification> getNotificationUnread(int id) {
        List<Notification> list = new ArrayList<>();
        String sql = "select * from notifications where customerid = ? and is_read = 0 order by id desc";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Notification(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4), rs.getString(5)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void unreadNotify(int id) {
        String sql = "Update notifications set is_read = 0 where id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void readNotify(int id) {
        String sql = "Update notifications set is_read = 1 where id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteNotify(int id) {
        String sql = "delete notifications where id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void readAllNotify(int cid) {
        String sql = "Update notifications set is_read = 1 where customerid = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cid);

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteAllNotify(int id) {
        String sql = "delete notifications where customerid = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getAllTotalUser() {
        String sql = "select count(*) from customer";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Customer> listUser(int index) {
        List<Customer> list = new ArrayList<>();
        String sql = "select * from customer c\n"
                + "join account a\n"
                + "on c.username=a.username\n"
                + "order by id\n"
                + "offset ? rows fetch next 6 rows only";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 6);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getString("nickname"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("address"),
                        rs.getInt("point"),
                        rs.getString("username"),
                        rs.getString("role"),
                        rs.getString("created_date"),
                        rs.getBoolean("status"),
                        rs.getBoolean("online")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getAllTotalUserByRole(String role) {
        String sql = "DECLARE @role NVARCHAR(50)\n"
                + "                SET @role = ?\n"
                + "                IF @role = 'all'\n"
                + "                BEGIN\n"
                + "                    SELECT count(*)\n"
                + "                    FROM customer c\n"
                + "                END\n"
                + "                ELSE\n"
                + "                BEGIN\n"
                + "                    SELECT count(*)\n"
                + "                    FROM customer c\n"
                + "                    JOIN account a ON c.username = a.username\n"
                + "                    WHERE role = @role\n"
                + "                END";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, role);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getAllTotalUserByStatus(String status) {
        String sql = "DECLARE @status NVARCHAR(50)\n"
                + "                SET @status = ?\n"
                + "                IF @status = 'allstatus'\n"
                + "                BEGIN\n"
                + "                    SELECT count(*)\n"
                + "                    FROM customer c\n"
                + "                END\n"
                + "                ELSE\n"
                + "                BEGIN\n"
                + "                    SELECT count(*)\n"
                + "                    FROM customer c\n"
                + "                    JOIN account a ON c.username = a.username\n"
                + "                    WHERE status = @status\n"
                + "                END";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, status);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void inactiveAcc(int id) {
        String sql = "UPDATE account\n"
                + "set status = 0\n"
                + "from customer\n"
                + "where [dbo].[Account].username like [dbo].[customer].username\n"
                + "AND [dbo].[customer].id=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void activeAcc(int id) {
        String sql = "UPDATE account\n"
                + "set status = 1\n"
                + "from customer\n"
                + "where [dbo].[Account].username like [dbo].[customer].username\n"
                + "AND [dbo].[customer].id=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Customer> filterRole(String role, int index) {
        List<Customer> list = new ArrayList<>();
        String sql = "DECLARE @role NVARCHAR(50);\n"
                + "SET @role = ?;\n"
                + "\n"
                + "IF @role = 'all'\n"
                + "BEGIN\n"
                + "    SELECT * \n"
                + "    FROM customer c\n"
                + "    JOIN account a ON c.username = a.username\n"
                + "    ORDER BY id\n"
                + "    offset ? rows fetch next 6 rows only\n"
                + "END\n"
                + "ELSE\n"
                + "BEGIN\n"
                + "    SELECT * \n"
                + "    FROM customer c\n"
                + "    JOIN account a ON c.username = a.username\n"
                + "    WHERE role = @role\n"
                + "    ORDER BY id\n"
                + "    offset ? rows fetch next 6 rows only\n"
                + "END";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, role);
            pre.setInt(2, (index - 1) * 6);
            pre.setInt(3, (index - 1) * 6);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getString("nickname"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("address"),
                        rs.getInt("point"),
                        rs.getString("username"),
                        rs.getString("role"),
                        rs.getString("created_date"),
                        rs.getBoolean("status"),
                        rs.getBoolean("online")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Customer> filterStatus(String status, int index) {
        List<Customer> list = new ArrayList<>();
        String sql = "DECLARE @status NVARCHAR(50);\n"
                + "SET @status = ?;\n"
                + "\n"
                + "IF @status = 'allstatus'\n"
                + "BEGIN\n"
                + "    SELECT * \n"
                + "    FROM customer c\n"
                + "    JOIN account a ON c.username = a.username\n"
                + "    ORDER BY id\n"
                + "offset ? rows fetch next 6 rows only\n"
                + "END\n"
                + "ELSE\n"
                + "BEGIN\n"
                + "    SELECT * \n"
                + "    FROM customer c\n"
                + "    JOIN account a ON c.username = a.username\n"
                + "    WHERE status = @status\n"
                + "    ORDER BY id\n"
                + "offset ? rows fetch next 6 rows only\n"
                + "END";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, status);
            pre.setInt(2, (index - 1) * 6);
            pre.setInt(3, (index - 1) * 6);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getString("nickname"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("address"),
                        rs.getInt("point"),
                        rs.getString("username"),
                        rs.getString("role"),
                        rs.getString("created_date"),
                        rs.getBoolean("status"),
                        rs.getBoolean("online")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    private static java.sql.Timestamp getCurrentTimestamp() {
        java.util.Date now = new java.util.Date();
        return new java.sql.Timestamp(now.getTime());
    }

    public List<Customer> getAllUser() {
        List<Customer> list = new ArrayList<>();
        String sql = "select * from customer c\n"
                + "join account a\n"
                + "on c.username=a.username\n"
                + "order by id";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getString("nickname"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("address"),
                        rs.getInt("point"),
                        rs.getString("username"),
                        rs.getString("role"),
                        rs.getString("created_date"),
                        rs.getBoolean("status"),
                        rs.getBoolean("online")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getMaxID() {
        int id = 0;
        try {
            String sql = "SELECT MAX(id) AS max_id FROM customer";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                id = rs.getInt("max_id");
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return id + 1;
    }

    public void addMembershipForBuyingMembership(int customer, String expiredate) {
        String sql = "update membershipdetail set expiredate=?,status=? where customerid=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, expiredate);
            pre.setString(2, "active");
            pre.setInt(3, customer);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void updateMembership(String customer) {
        CustomerDAO cdao = new CustomerDAO();
        String sql = "SELECT \n"
                + "    [customerid],\n"
                + "    SUM([amount]) AS total_amount\n"
                + "FROM \n"
                + "    [PickleBallManagement].[dbo].[historypayment] where customerid=?\n"
                + "GROUP BY \n"
                + "    [customerid]";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, customer);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                double total = rs.getDouble("total_amount");
                if (total > 0 && total < 200000) {
                    cdao.addMembership(customer, "3");
                } else if (total >= 200000 && total < 500000) {
                    cdao.addMembership(customer, "1");
                } else if (total >= 500000 && total < 1000000) {
                    cdao.addMembership(customer, "2");
                } else if (total >= 1000000 && total < 10000000) {
                    cdao.addMembership(customer, "4");
                } else if (total >= 10000000 && total < 50000000) {
                    cdao.addMembership(customer, "5");
                } else if (total >= 500000000 && total < 1000000000) {
                    cdao.addMembership(customer, "6");
                } else if (total >= 1000000000) {
                    cdao.addMembership(customer, "7");
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addMembership(String customer, String membership) {
        String sql1 = "select * from membershipdetail where customerid=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql1);
            pre.setString(1, customer);
            ResultSet rs = pre.executeQuery();
            if (!rs.next()) {
                String sql2 = "insert into membershipdetail(customerid,membershipid) values(?,?)";
                try {
                    PreparedStatement pre2 = connection.prepareStatement(sql2);
                    pre2.setString(1, customer);
                    pre2.setString(2, membership);
                    ResultSet rs2 = pre2.executeQuery();

                } catch (SQLException e) {
                    System.out.println(e);
                }
            } else {
                String sql3 = " update membershipdetail set membershipid=? where customerid=?";
                try {
                    PreparedStatement pre3 = connection.prepareStatement(sql3);
                    pre3.setString(1, membership);
                    pre3.setString(2, customer);
                    ResultSet rs3 = pre3.executeQuery();

                } catch (SQLException e) {
                    System.out.println(e);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public List<TransactionHistory> getAllHistory(int id) {
        List<TransactionHistory> list = new ArrayList<>();
        String sql = "select * from historypayment where customerid = ? order by [date] desc";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new TransactionHistory(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Customer getCustomerByUsernameRank(String username) {
        Customer c = new Customer();
        String sql = "select * from [dbo].[Customer] where username = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("full_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                int point = rs.getInt("point");
                RankDAO rd = new RankDAO();
                AccountDAO ad = new AccountDAO();
                c = new Customer(id, fullname, email, phone, address, point, rd.getRankById(rs.getInt("rankid")), username);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return c;
    }

    public Customer getCustomerByIdRank(int id) {
        Customer c = new Customer();
        String sql = "select * from [dbo].[Customer] c\n"
                + "join account a\n"
                + "on c.username=a.username\n"
                + "where id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String fullname = rs.getString("full_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                int point = rs.getInt("point");
                String username = rs.getString("username");
                RankDAO rd = new RankDAO();
                AccountDAO ad = new AccountDAO();

                c = new Customer(id, fullname, email, phone, address, point, rd.getRankById(rs.getInt("rankid")), username);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return c;
    }

    public Date getMembershipExpiredate(int customer) {
        String sql = "select expiredate from membershipdetail where customerid=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, customer);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                Date date = rs.getDate("expiredate");
                return date;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Bag checkBagExist(int accountID, int productID) {

        String sql = "select * from bag\r\n"
                + "where [customerid] = ? and [productid] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
            st.setInt(2, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Bag(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int getMembershipType(int id) {

        String sql = "select membershipid from membershipdetail where customerid = ? and status ='active'";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return (rs.getInt(1));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    public String getMembershipName(int id) {

        String sql = " select type from membershipdetail m,membership mem where customerid = ? and mem.id=m.membershipid";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return (rs.getString("type"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "";
    }

    public List<Membership> getMembership() {
        List<Membership> list = new ArrayList<>();
        String sql = "select * from membership";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Membership(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void editAmountAndSizeCart(int accountID, int productID, int amount) {
        String sql = "update bag set [amount]=? "
                + "where [customerid]=? and [productID]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, amount);
            st.setInt(2, accountID);
            st.setInt(3, productID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertCart(int accountID, int productID, int amount) {
        String sql = "insert bag(customerID, productID, amount)\r\n"
                + "values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
            st.setInt(2, productID);
            st.setInt(3, amount);

            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void subPoint(int point, int id) {
        String sql = "UPDATE customer\n"
                + "SET point = point - ? "
                + "WHERE id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, point);
            pre.setInt(2, id);

            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Bag loadBag(int accID, int pid) {
        String sql = "select * from bag where customerid=? AND ProductID=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, accID);
            pre.setInt(2, pid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                new Bag(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Bag> loadBag(int accID) {
        List<Bag> list = new ArrayList<>();
        String sql = "select * from bag where customerid=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, accID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Bag(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(int id) {
        String sql = "select * from product p where p.id=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public int createOrder(int totalMoney, int customerId) {
        String sql = "INSERT INTO orders (customerid, total, createdate, ispayment) VALUES (?, ?, ?, 0)";

        try (PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            statement.setInt(1, customerId);
            statement.setInt(2, totalMoney);
            statement.setTimestamp(3, getCurrentTimestamp());

            statement.executeUpdate();

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);  // Lấy ID tự tăng
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void createOrderDetails(int orderID, List<Bag> bag) {
        String sql = "INSERT INTO ordersdetail (orderid, productid, quantity) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            for (Bag b : bag) {

                statement.setInt(1, orderID);
                statement.setInt(2, b.getProductid());
                statement.setInt(3, b.getAmount());
                statement.addBatch();

            }
            statement.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void clearCart(int customerid) {
        String sql = "DELETE FROM bag WHERE customerid = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, customerid);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Orders> getOrdersByCustomerId(int id) {
        List<Orders> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE customerid = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orders.add(new Orders(rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getString(4), rs.getBoolean(5)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<OrdersDetail> loadOrderDetailByOrderId(int orderid) {
        List<OrdersDetail> list = new ArrayList<>();
        String sql = "select * from OrdersDetail where orderid=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, orderid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new OrdersDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Orders getOrderById(int orderId) {
        Orders orders = null;
        String sql = "SELECT * FROM orders WHERE id = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Orders(rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getString(4), rs.getBoolean(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updatePayment(int orderID) {
        String sql = "UPDATE orders SET ispayment = 1 WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, orderID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Orders> getAllOrders() {
        List<Orders> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY id asc";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                orders.add(new Orders(rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getString(4), rs.getBoolean(5)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Orders> getOrderByDate(Date from, Date to) {
        List<Orders> orders = new ArrayList<>();
        String sql = "select * from orders where  1=1 ";
        if (from != null) {
            sql += " and createdate >='" + from + "'";
        }
        if (to != null) {
            sql += " and createdate <='" + to + "'";
        }

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                orders.add(new Orders(rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getString(4), rs.getBoolean(5)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Product> getProductByIndex(int indexPage) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product \r\n"
                + "order by [id]\r\n"
                + "offset ? rows\r\n"
                + "fetch next 5 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, (indexPage - 1) * 5);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)));;
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int countAllProduct() {
        String sql = "select count(*) from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public void insertProduct(String name, String image, String price, int memberid) {
        String sql = "INSERT INTO [dbo].[product]\n"
                + "           ([name]\n"
                + "           ,[image]\n"
                + "           ,[cost]\n"
                + "           ,[memberid]\n"
                + "           ,[amount])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, price);
            // st.setString(4, title);

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> loadProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product p, membership m where p.memberid = m.id order by m.id asc";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertProduct(String name, String image, int price, int memberid) {
        String sql = "INSERT INTO [dbo].[product]\n"
                + "           ([name]\n"
                + "           ,[image]\n"
                + "           ,[cost]\n"
                + "           ,[memberid]\n"
                + ")\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setInt(3, price);
            st.setInt(4, memberid);

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProductById(int pid) {
        String sql = "delete from Product\n"
                + "where [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editProduct(String name, String image, String price,
          String memberid, String pid) {
        String sql = "UPDATE [dbo].[product]\n"
                + "   SET [name] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[cost] = ?\n"
                + "      ,[memberid] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, price);
            st.setString(4, memberid);
            st.setString(5, pid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public static void main(String[] args) {
        CustomerDAO cdao = new CustomerDAO();
        System.out.println(cdao.getMembershipName(6));
    }
}
