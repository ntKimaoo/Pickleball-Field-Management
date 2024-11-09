/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Account;
import Model.Base;
import Model.Employee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author thang
 */
public class BaseDAO extends DBContext {

    public List<Base> getAll() {
        List<Base> list = new ArrayList<>();
        String sql = "select * from base";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int Id = rs.getInt("id");
                String Address = rs.getString("address");
                list.add(new Base(Id, Address));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public String getBaseAddress(int id) {
        String sql = "select * from base where id=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String Address = rs.getString("address");
                return Address;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Map<String, Integer> bookingsCount() {
        Map<String, Integer> bookingsCount = new LinkedHashMap<>();
        String[] daysOfWeek = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
        String sql = "SELECT DATEPART(WEEKDAY, bookeddate) AS day_of_week, COUNT(*) AS count\n"
                + "             FROM rentfield \n"
                + "             WHERE bookeddate >= DATEADD(WEEK, DATEDIFF(WEEK, 0, GETDATE()), 0) \n"
                + "             AND bookeddate < DATEADD(WEEK, DATEDIFF(WEEK, 0, GETDATE()) + 1, 0)\n"
                + "             GROUP BY DATEPART(WEEKDAY, bookeddate)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            for (String day : daysOfWeek) {
                bookingsCount.put(day, 0);
            }
            while (rs.next()) {
                int dayOfWeek = rs.getInt("day_of_week");
                int count = rs.getInt("count");
                bookingsCount.put(daysOfWeek[dayOfWeek - 1], count);
            }
            return bookingsCount;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Map<String, Integer> bookingsCountHours() {
        Map<String, Integer> bookingsCount = new LinkedHashMap<>();
        String[] daysOfWeek = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
        String sql = "SELECT \n"
                + "    DATEPART(WEEKDAY, bookeddate) AS day_of_week,\n"
                + "    COUNT(*) AS count\n"
                + "FROM \n"
                + "    rentfield\n"
                + "WHERE \n"
                + "    bookeddate >= DATEADD(WEEK, DATEDIFF(WEEK, 0, GETDATE()), 0) \n"
                + "    AND bookeddate < DATEADD(WEEK, DATEDIFF(WEEK, 0, GETDATE()) + 1, 0)\n"
                + "GROUP BY \n"
                + "    DATEPART(WEEKDAY, bookeddate)\n"
                + "ORDER BY \n"
                + "    CASE \n"
                + "        WHEN DATEPART(WEEKDAY, bookeddate) = 1 THEN 7\n"
                + "        ELSE DATEPART(WEEKDAY, bookeddate) - 1         \n"
                + "    END;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            for (String day : daysOfWeek) {
                bookingsCount.put(day, 0);
            }
            while (rs.next()) {
                int dayOfWeek = rs.getInt("day_of_week");
                int count = rs.getInt("count");
                bookingsCount.put(daysOfWeek[dayOfWeek - 1], count);
            }
            return bookingsCount;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<Employee> getEmployeeInBase(String id){
       List<Employee> list = new ArrayList<>();
        String sql = "select * from staff c\n"
                + "join account a\n"
                + "on c.username=a.username\n"
                + "where baseid=? order by id";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1,id);
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

    public static void main(String[] args) {
        for (Employee b : new BaseDAO().getEmployeeInBase("3")) {
            System.out.println(b.getId());
        }
    }
}
