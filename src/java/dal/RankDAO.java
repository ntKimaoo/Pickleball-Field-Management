/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Rank;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pc
 */
public class RankDAO extends DBContext {

    public Rank getRankById(int id) {
        Rank r = new Rank();
        String sql = "select * from [dbo].[Rank] where rankid = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {

                int rank_id = rs.getInt("rankid");
                String name = rs.getString("rank_name");
                int min_point = rs.getInt("min_point");
                String img = rs.getString("img");

                r = new Rank(rank_id, name, min_point, img);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return r;
    }
    
    public Rank getRankByName(String name) {
        Rank r = new Rank();
        String sql = "select * from [dbo].[Rank] where rank_name = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int rank_id = rs.getInt("rankid");
                String rname = rs.getString("rank_name");
                int min_point = rs.getInt("min_point");
                String img = rs.getString("img");

                r = new Rank(rank_id, rname, min_point, img);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return r;
    }

    public List<Rank> getRank() {
        List<Rank> list = new ArrayList<>();
        String sql = "select * from [dbo].[Rank]";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int rank_id = rs.getInt("rankid");
                String name = rs.getString("rank_name");
                int min_point = rs.getInt("min_point");
                String img = rs.getString("img");
                list.add(new Rank(rank_id, name, min_point, img));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Rank> searchByName(String name){
        List<Rank> list = new ArrayList<>();
        String sql = "select * from [dbo].[Rank] where rank_name LIKE ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            String namePattern = "%" + name + "%";
            pre.setString(1, namePattern);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int rank_id = rs.getInt("rankid");
                String rank_name = rs.getString("rank_name");
                int min_point = rs.getInt("min_point");
                String img = rs.getString("img");
                list.add(new Rank(rank_id, rank_name, min_point, img));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void insertRank(Rank a) {
        String sql = "INSERT INTO [dbo].[rank]\n"
                + "           ([rankid]\n"
                + "           ,[rank_name]\n"
                + "           ,[min_point]\n"
                + "           ,[img])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getRank_id());
            st.setString(2, a.getRank_name());
            st.setInt(3, a.getMin_point());
            st.setString(4, a.getImg());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteRank(Rank a) {
        String sql = "DELETE FROM [dbo].[rank]\n"
                + "      WHERE rankid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getRank_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateRank(Rank a) {

        String sql = "UPDATE [dbo].[rank]\n"
                + "   SET [rank_name] = ?\n"
                + "      ,[min_point] = ?\n"
                + "      ,[img] = ?\n"
                + " WHERE rankid = ?";
        try {
            //thuc thi cau truy van
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, a.getRank_name());
            pre.setInt(2, a.getMin_point());
            pre.setString(3, a.getImg());
            pre.setInt(4, a.getRank_id());
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public static void main(String[] args) {
        RankDAO rd = new RankDAO();
        for (Rank r: rd.searchByName("e")) {
            System.out.println(r.getRank_name());
        }
    }
}
