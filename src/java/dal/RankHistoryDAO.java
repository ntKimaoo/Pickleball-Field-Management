/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.RankHistory;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author pc
 */
public class RankHistoryDAO extends DBContext {

    public List<RankHistory> getRankHistoryByCustomerId(int id) {
        List<RankHistory> list = new ArrayList<>();
        String sql = "select * from [dbo].[RankHistory] where customer_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int history_id = rs.getInt("history_id");
                CustomerDAO cd = new CustomerDAO();
                RankDAO rd = new RankDAO();
                String date = rs.getString("change_date");
                list.add(new RankHistory(history_id, cd.getCustomerById(rs.getInt("customer_id")), rd.getRankById(rs.getInt("rank_id")), date));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public RankHistory getRankHistoryById(int id) {
        String sql = "select * from [dbo].[RankHistory] where history_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int history_id = rs.getInt("history_id");
                CustomerDAO cd = new CustomerDAO();
                RankDAO rd = new RankDAO();
                String date = rs.getString("change_date");
                return new RankHistory(history_id, cd.getCustomerById(rs.getInt("customer_id")), rd.getRankById(rs.getInt("rank_id")), date);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<RankHistory> getRankHistory() {
        List<RankHistory> list = new ArrayList<>();
        String sql = "select * from [dbo].[RankHistory]";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int history_id = rs.getInt("history_id");
                CustomerDAO cd = new CustomerDAO();
                RankDAO rd = new RankDAO();
                String date = rs.getString("change_date");
                list.add(new RankHistory(history_id, cd.getCustomerById(rs.getInt("customer_id")), rd.getRankById(rs.getInt("rank_id")), date));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertRankHistory(RankHistory a) {
        String sql = "INSERT INTO [dbo].[RankHistory]\n"
                + "           ([customer_id]\n"
                + "           ,[rank_id]\n"
                + "           ,[change_date])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getCustomer().getId());
            st.setInt(2, a.getRank().getRank_id());
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date parsedDate = dateFormat.parse(a.getChange_date());
            // Convert to java.sql.Timestamp
            Timestamp timestamp = new Timestamp(parsedDate.getTime());
            st.setTimestamp(3, timestamp);
            st.executeUpdate();
        } catch (SQLException | ParseException e) {
            System.out.println(e);
        }
    }

    public void updateRankHistory(RankHistory a) {
        String sql = "UPDATE [dbo].[RankHistory]\n"
                + "   SET [customer_id] = ?\n"
                + "      ,[rank_id] = ?\n"
                + "      ,[change_date] = ?\n"
                + " WHERE hitory_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getCustomer().getId());
            st.setInt(2, a.getRank().getRank_id());
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date parsedDate = dateFormat.parse(a.getChange_date());
            // Convert to java.sql.Timestamp
            Timestamp timestamp = new Timestamp(parsedDate.getTime());
            st.setTimestamp(3, timestamp);
            st.setInt(4, a.getHistory_id());
            st.executeUpdate();
        } catch (SQLException | ParseException e) {
            System.out.println(e);
        }
    }

    public void deleteRank(RankHistory a) {
        String sql = "DELETE FROM [dbo].[RankHistory]\n"
                + "      WHERE history_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getHistory_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<RankHistory> searchByName(String name) {
        List<RankHistory> list = new ArrayList<>();
        String sql = "select distinct rh.history_id, rh.customer_id, rh.rank_id, rh.change_date\n"
                + "from [dbo].[RankHistory] rh, [dbo].[Rank] r, [dbo].[customer] c \n"
                + "where rh.rank_id = r.rankid and r.rankid = c.rank_id and (r.rank_name LIKE ? or c.username LIKE ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            String namePattern = "%" + name + "%";
            pre.setString(1, namePattern);
            pre.setString(2, namePattern);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int history_id = rs.getInt("history_id");
                RankDAO rd = new RankDAO();
                CustomerDAO cd = new CustomerDAO();
                String change_date = rs.getString("change_date");
                list.add(new RankHistory(history_id, cd.getCustomerById(rs.getInt("customer_id")), rd.getRankById(rs.getInt("rank_id")), change_date));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<RankHistory> searchByNameForCustomer(int id, String name) {
        List<RankHistory> list = new ArrayList<>();
        String sql = "select * from [dbo].[RankHistory] rh, [dbo].[Rank] r where rh.customer_id =? and (rh.rank_id = r.rankid and r.rank_name LIKE ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            String namePattern = "%" + name + "%";
            pre.setInt(1, id);
            pre.setString(2, namePattern);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int history_id = rs.getInt("history_id");
                RankDAO rd = new RankDAO();
                CustomerDAO cd = new CustomerDAO();
                String change_date = rs.getString("change_date");
                list.add(new RankHistory(history_id, cd.getCustomerById(rs.getInt("customer_id")), rd.getRankById(rs.getInt("rank_id")), change_date));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        RankHistoryDAO rhd = new RankHistoryDAO();
        CustomerDAO cd = new CustomerDAO();
        RankDAO rd = new RankDAO();
//        System.out.println(java.time.LocalDate.now().toString()+" "+java.time.LocalTime.now().toString());
//        rhd.insertRankHistory(new RankHistory(rhd.getRankHistory().get(rhd.getRankHistory().size()-1).getHistory_id()+1, cd.getCustomerById(10), rd.getRankById(1), java.time.LocalDate.now().toString()+" "+java.time.LocalTime.now().toString()));
        System.out.println(rhd.searchByNameForCustomer(3, "Bronze").get(0).getChange_date());
    }
}
