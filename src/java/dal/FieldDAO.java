/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Base;
import Model.Field;
import Model.RentField;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author thang
 */
public class FieldDAO extends DBContext {

    public List<Field> getAllByBase(int Baseid) {
        List<Field> list = new ArrayList<>();
        String sql = "select * from field where baseid=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, Baseid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int Id = rs.getInt("id");
                String status = rs.getString("status");
                int cost = rs.getInt("cost");
                boolean viponly = rs.getBoolean("viponly");
                String image = rs.getString("image");
                list.add(new Field(Id, cost, status, viponly, image));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Field getFieldById(int Fieldid) {
        Field f = new Field();
        String sql = "select * from field where id=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, Fieldid);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int Id = rs.getInt("id");
                String status = rs.getString("status");
                int cost = rs.getInt("cost");
                boolean viponly = rs.getBoolean("viponly");
                String image = rs.getString("image");
                String base = rs.getString("baseid");
                f = new Field(Id, cost, status, viponly, base, image);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return f;
    }

    public List<Field> getAll() {
        List<Field> list = new ArrayList<>();
        String sql = "select * from field f,base b where b.id=f.baseid";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int Id = rs.getInt("id");
                String status = rs.getString("status");
                int cost = rs.getInt("cost");
                boolean viponly = rs.getBoolean("viponly");
                String base = rs.getString("address");
                String image = rs.getString("image");
                list.add(new Field(Id, cost, status, viponly, base, image));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<String> getRentField(String from, String to, String fieldid) {
        CustomerDAO cdao = new CustomerDAO();
        List<String> list = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy_HH:mm");
        String sql = "select * from rentfield where bookeddate BETWEEN ? AND ? and fieldid=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, from);
            pre.setString(2, to);
            pre.setString(3, fieldid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Date date = rs.getTimestamp("bookeddate");
                String customerid = rs.getString("customerid");
                String result = sdf.format(date) + " " + cdao.getCustomerById(Integer.parseInt(customerid)).getNickName();
                list.add(result);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<RentField> getRentFieldAll(String customerid) {
        CustomerDAO cdao = new CustomerDAO();
        List<RentField> list = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy_HH:mm");
        String sql = "select * from rentfield where customerid=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, customerid);

            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String date = rs.getTimestamp("bookeddate").toString();
                String fieldid = rs.getString("fieldid");
                String voucher = rs.getString("voucher");
                list.add(new RentField(id, fieldid, customerid, date.split(" ")[0], date.split(" ")[1], voucher));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertRentField(String bookedate, int customerid, String fieldid) {
        String sql = "insert into rentfield values(?,?,?,?)";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, bookedate.split("_")[0] + " " + bookedate.split("_")[1]);
            pre.setInt(2, customerid);
            pre.setString(3, null);
            pre.setString(4, fieldid);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertRentHistory(String bookedate, int customerid, String fieldid) {
        String sql = "insert into historyrent values(?,?,?,?)";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, bookedate);
            pre.setInt(2, customerid);
            pre.setString(3, null);
            pre.setString(4, fieldid);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<RentField> getRentedField() {
        List<RentField> list = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy_HH:mm");
        String sql = "SELECT *\n"
                + "FROM [PickleBallManagement].[dbo].[rentfield]\n"
                + "WHERE bookeddate < GETDATE();";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String date = rs.getTimestamp("bookeddate").toString();
                String fieldid = rs.getString("fieldid");
                String voucher = rs.getString("voucher");
                String customerid = rs.getString("customerid");
                list.add(new RentField(id, fieldid, customerid, date.split(" ")[0], date.split(" ")[1], voucher));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public void updateRentedField(){
        for(RentField r:this.getRentedField()){
            this.deleteRentField(r.getId());
            this.insertRentHistory(r.getDate()+" "+r.getTime(), Integer.parseInt(r.getCustomerid()), r.getFieldid());
        }
    }
    public void deleteRentField(String id) {
        String sql = "delete from rentfield where id=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateField(Field f) {
        String sql = "update field set status=?,cost=?,viponly=?,baseid=?,image=? where id=?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, f.getStatus());
            pre.setInt(2, f.getCost());
            pre.setBoolean(3, f.isViponly());
            pre.setString(4, f.getBase());
            pre.setString(5, f.getImage());
            pre.setInt(6, f.getId());

            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertField(Field f) {
        String sql = "insert into field(status,cost,viponly,baseid,image) values(?,?,?,?,?)";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, f.getStatus());
            pre.setInt(2, f.getCost());
            pre.setBoolean(3, f.isViponly());
            pre.setString(4, f.getBase());
            pre.setString(5, f.getImage());

            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        FieldDAO fdao = new FieldDAO();
       for(RentField r:fdao.getRentedField()){
            System.out.println(r.getDate()+" "+r.getTime());
        }
    }
}
