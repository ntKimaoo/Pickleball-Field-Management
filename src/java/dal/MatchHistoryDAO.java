/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.MatchHistory;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pc
 */
public class MatchHistoryDAO extends DBContext {

    public List<MatchHistory> getMatchHistory() {
        List<MatchHistory> list = new ArrayList<>();
        String sql = "select * from [dbo].[matchplayed]";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int match_id = rs.getInt("id");
                String date = rs.getString("date");
                int resultwin = rs.getInt("resultwin");
                int resultlose = rs.getInt("resultlose");
                int betpoint = rs.getInt("betpoint");
                FieldDAO fd = new FieldDAO();
                CustomerDAO cd = new CustomerDAO();
                list.add(new MatchHistory(match_id, date, resultwin, resultlose, betpoint, fd.getFieldById(rs.getInt("fieldid")), cd.getCustomerById(rs.getInt("player1")), cd.getCustomerById(rs.getInt("player2")), cd.getCustomerById(rs.getInt("winner"))));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<MatchHistory> getMatchHistoryByCustomerId(int id) {
        List<MatchHistory> list = new ArrayList<>();
        String sql = "select * from [dbo].[matchplayed] where player1 = ? or player2 = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.setInt(2, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int match_id = rs.getInt("id");
                String date = rs.getString("date");
                int resultwin = rs.getInt("resultwin");
                int resultlose = rs.getInt("resultlose");
                int betpoint = rs.getInt("betpoint");
                FieldDAO fd = new FieldDAO();
                CustomerDAO cd = new CustomerDAO();
                list.add(new MatchHistory(match_id, date, resultwin, resultlose, betpoint, fd.getFieldById(rs.getInt("fieldid")), cd.getCustomerById(rs.getInt("player1")), cd.getCustomerById(rs.getInt("player2")), cd.getCustomerById(rs.getInt("winner"))));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
//    public static void main(String[] args) {
//        for (MatchHistory mh: new MatchHistoryDAO().getMatchHistoryByCustomerId(3)) {
//            System.out.println(mh.getPlayer1().getFullName());
//        }
//    }
}
