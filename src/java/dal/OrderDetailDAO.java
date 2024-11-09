/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Item;
import Model.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO extends DBContext {

    public void addOrderDetail(OrderDetail order) {
        String sql = "INSERT INTO OrderDetail (order_id, item_id, quantity, price) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, order.getOrder_id());
            pre.setInt(2, order.getItem_id());
            pre.setInt(3, order.getQuantity());
            pre.setDouble(4, order.getPrice());
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<OrderDetail> getOrderDetailByOid(int order_id) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select * from OrderDetail od join item i on i.item_id = od.item_id where order_id =?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, order_id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int orderDetailId = rs.getInt("order_detail_id");
                int orderrId = rs.getInt("order_id");
                int itemId = rs.getInt("item_id");
                int quantity = rs.getInt("quantity");
                double price = rs.getFloat("price");
                OrderDetail o = new OrderDetail(orderDetailId, itemId, quantity, order_id, price);
                list.add(o);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
   
}
