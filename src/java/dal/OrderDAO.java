/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {

    public int addOrder(int customerId, double totalAmount, boolean status) {
        String sql = "INSERT INTO [Order] (customer_id, total_price,status, created_date) VALUES (?, ?, ?,GETDATE())";
        try {
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setInt(1, customerId);
            pre.setDouble(2, totalAmount);
            pre.setBoolean(3, status);
            pre.executeUpdate();

            ResultSet rs = pre.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order]";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int customer_id = rs.getInt("customer_id");
                double total_price = rs.getFloat("total_price");
                Date orderDate = new Date(rs.getDate("created_Date").getTime());
                boolean status = rs.getBoolean("status");
                String voucher = rs.getString("voucher_code");
                Order o = new Order(order_id, customer_id, total_price, orderDate.toString(), status, voucher);
                list.add(o);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void updateOrderStatus(String id, boolean status) {
        String sql = "UPDATE [Order] SET [status] = ? where order_id = ? ";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, status);
            pre.setString(2, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Order> getOrderStatus(boolean status) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] where [status] = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, status);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int customer_id = rs.getInt("customer_id");
                float total_price = rs.getFloat("total_price");
                Date orderDate = new Date(rs.getDate("created_Date").getTime());
                boolean ostatus = rs.getBoolean("status");
                String voucher = rs.getString("voucher_code");
                Order o = new Order(order_id, customer_id, total_price, orderDate.toString(), ostatus, voucher);
                list.add(o);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getOrderStatusASC(boolean status) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] where [status] = ? order by total_price asc";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, status);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int customer_id = rs.getInt("customer_id");
                float total_price = rs.getFloat("total_price");
                Date orderDate = new Date(rs.getDate("created_Date").getTime());
                boolean ostatus = rs.getBoolean("status");
                String voucher = rs.getString("voucher_code");
                Order o = new Order(order_id, customer_id, total_price, orderDate.toString(), ostatus, voucher);
                list.add(o);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getOrderStatusDESC(boolean status) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] where [status] = ? order by total_price desc";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, status);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int customer_id = rs.getInt("customer_id");
                float total_price = rs.getFloat("total_price");
                Date orderDate = new Date(rs.getDate("created_Date").getTime());
                boolean ostatus = rs.getBoolean("status");
                String voucher = rs.getString("voucher_code");
                Order o = new Order(order_id, customer_id, total_price, orderDate.toString(), ostatus, voucher);
                list.add(o);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getDateASC() {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] order by total_price asc";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int customer_id = rs.getInt("customer_id");
                float total_price = rs.getFloat("total_price");
                Date orderDate = new Date(rs.getDate("created_Date").getTime());
                boolean status = rs.getBoolean("status");
                String voucher = rs.getString("voucher_code");
                Order o = new Order(order_id, customer_id, total_price, orderDate.toString(), status, voucher);
                list.add(o);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Order> getDateDESC() {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] order by total_price desc";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int customer_id = rs.getInt("customer_id");
                float total_price = rs.getFloat("total_price");
                Date orderDate = new Date(rs.getDate("created_Date").getTime());
                boolean status = rs.getBoolean("status");
                String voucher = rs.getString("voucher_code");
                Order o = new Order(order_id, customer_id, total_price, orderDate.toString(), status, voucher);
                list.add(o);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getNumberPageItem() {
        String sql = "select count(*) from [Order]";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Order> getPaging(int page, int pageSize) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] order by order_id offset (?-1)*? rows fetch first ? rows only";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, page);
            pre.setInt(2, pageSize);
            pre.setInt(3, pageSize);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int customer_id = rs.getInt("customer_id");
                float total_price = rs.getFloat("total_price");
                Date orderDate = new Date(rs.getDate("created_Date").getTime());
                boolean status = rs.getBoolean("status");
                String voucher = rs.getString("voucher_code");
                Order o = new Order(order_id, customer_id, total_price, orderDate.toString(), status, voucher);
                list.add(o);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getNumberOfOrder(int month,int year) {
        String sql = "SELECT COUNT(*) AS order_count\n"
                + "FROM [order]\n"
                + "WHERE DATEPART(MONTH, created_date) = ?\n"
                + "  AND DATEPART(YEAR, created_date) = ?;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, month);
            pre.setInt(2, year);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    public int getTotalOfOrder(int month,int year) {
        String sql = "SELECT SUM(total_price)\n"
                + "FROM [order]\n"
                + "WHERE DATEPART(MONTH, created_date) = ?\n"
                + "  AND DATEPART(YEAR, created_date) = ?;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, month);
            pre.setInt(2, year);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public static void main(String[] args) {
        OrderDAO odao = new OrderDAO();
        for (Order arg : odao.getDateDESC()) {
            System.out.println(arg);
        }
    }
}
