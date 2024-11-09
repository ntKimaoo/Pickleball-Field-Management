/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Employee;
import Model.Voucher;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kiennn
 */
public class VoucherDAO extends DBContext {

    public List<Voucher> getAllVoucher() {
        List<Voucher> list = new ArrayList<>();
        String sql = "select * from voucher";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Voucher(rs.getString("code"),
                        rs.getDate("expiredate"),
                        rs.getString("usecondition"),
                        rs.getInt("quantity"),
                        rs.getInt("percent")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Voucher> getAllVoucherBySort(String sort) {
        List<Voucher> list = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM voucher\n"
                + "ORDER BY [percent] ?;";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, sort);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Voucher(rs.getString("code"),
                        rs.getDate("expiredate"),
                        rs.getString("usecondition"),
                        rs.getInt("quantity"),
                        rs.getInt("percent")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Voucher> getAllVoucherByStatus(String sort) {
        List<Voucher> list = new ArrayList<>();
        String sql = "SELECT *,\n"
                + "       CASE \n"
                + "           WHEN quantity = 0 THEN 0\n"
                + "           ELSE 1\n"
                + "       END AS status\n"
                + "FROM voucher;";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, sort);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Voucher(rs.getString("code"),
                        rs.getDate("expiredate"),
                        rs.getString("usecondition"),
                        rs.getInt("quantity"),
                        rs.getInt("percent")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Voucher> getAllVoucherByBoth(String sort, String status) {
        List<Voucher> list = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM voucher\n"
                + "ORDER BY [percent] ?;";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, sort);
            pre.setString(2, status);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Voucher(rs.getString("code"),
                        rs.getDate("expiredate"),
                        rs.getString("usecondition"),
                        rs.getInt("quantity"),
                        rs.getInt("percent")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Voucher> getAllVoucher(int index) {
        List<Voucher> list = new ArrayList<>();
        String sql = "select * from voucher\n"
                + "order by code\n"
                + "offset ? rows fetch next 6 rows only";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 6);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Voucher(rs.getString("code"),
                        rs.getDate("expiredate"),
                        rs.getString("usecondition"),
                        rs.getInt("quantity"),
                        rs.getInt("percent")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertVoucher(Voucher v) {
        String sql = "insert into voucher\n"
                + "values (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, v.getCode());
            st.setString(2, v.getExpiredate().toString());
            st.setString(3, v.getUsecondition());
            st.setInt(4, v.getQuantity());
            st.setInt(5, v.getPercent());
            st.executeUpdate();

        } catch (SQLException sqle) {
            System.out.println(sqle);
        }

    }

    public int getAllTotalVoucher() {
        String sql = "select count(*) from voucher";

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
