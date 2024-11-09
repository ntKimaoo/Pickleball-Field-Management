/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Customer;
import Model.Employee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kiennn
 */
public class EmployeeDAO extends DBContext{
    public List<Employee> getAllEm() {
        List<Employee> list = new ArrayList<>();
        String sql = "select * from staff c\n"
                + "join account a\n"
                + "on c.username=a.username\n"
                + "order by id";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Employee(rs.getInt("id"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("phonenumber"),
                        rs.getString("address"),
                        rs.getInt("baseid"),
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
    public List<Employee> getEmFilter(int index) {
        List<Employee> list = new ArrayList<>();
        String sql = "select * from staff c\n"
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
                list.add(new Employee(rs.getInt("id"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("phonenumber"),
                        rs.getString("address"),
                        rs.getInt("baseid"),
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
    public List<Employee> getEmFilterById(int cid,boolean status) {
        List<Employee> list = new ArrayList<>();
        String sql = "select * from staff c\n"
                + "join account a\n"
                + "on c.username=a.username\n"
                + "where status=?"
                + "order by id\n";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cid);
            pre.setBoolean(2, status);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Employee(rs.getInt("id"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("phonenumber"),
                        rs.getString("address"),
                        rs.getInt("baseid"),
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
    public List<Employee> getEmFilterById(int cid) {
        List<Employee> list = new ArrayList<>();
        String sql = "select * from staff c\n"
                + "join account a\n"
                + "on c.username=a.username\n"
                + "where baseid=?\n"
                + "order by id";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Employee(rs.getInt("id"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("phonenumber"),
                        rs.getString("address"),
                        rs.getInt("baseid"),
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
    public List<Employee> getEmFilterByStatus(boolean status) {
        List<Employee> list = new ArrayList<>();
        String sql = "select * from staff c\n"
                + "join account a\n"
                + "on c.username=a.username\n"
                + "where status=?\n"
                + "order by id\n";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, status);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Employee(rs.getInt("id"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("phonenumber"),
                        rs.getString("address"),
                        rs.getInt("baseid"),
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
    public void insertStaff(Employee e, String username) {
        String sql = "insert into staff(fullname,email,username,baseid)\n"
                + "values (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, e.getFullname());
            st.setString(2, e.getEmail());
            st.setString(3, username);
            st.setInt(4, e.getBaseid());
            st.executeUpdate();

        } catch (SQLException sqle) {
            System.out.println(sqle);
        }

    }
    public Employee getStaffByUsername(String username) {
        Employee c = new Employee();
        String sql = "select * from [dbo].[Staff] where username = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                String phone = rs.getString("phonenumber");
                String address = rs.getString("address");
                int baseid =rs.getInt("baseid");
                c = new Employee(id, fullname, email, phone, address, baseid);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return c;
    }
    
    public void activeAccStaff(int id) {
        String sql = "UPDATE account\n"
                + "set status = 1\n"
                + "from staff\n"
                + "where [dbo].[Account].username like [dbo].[staff].username\n"
                + "AND [dbo].[staff].id=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void deactiveAccStaff(int id) {
        String sql = "UPDATE account\n"
                + "set status = 0\n"
                + "from staff\n"
                + "where [dbo].[Account].username like [dbo].[staff].username\n"
                + "AND [dbo].[staff].id=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public int getAllTotalEm() {
        String sql = "select count(*) from staff";

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
}
