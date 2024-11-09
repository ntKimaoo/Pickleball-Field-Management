/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Category;
import Model.Item;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ItemDAO extends DBContext {

    public List<Item> getAllItem() {
        ArrayList<Item> itemList = new ArrayList<>();
        String sql = "select * from item i join category_item c on i.item_category_id = c.item_category_id";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("item_id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                float cost = rs.getFloat("cost");
                boolean status = rs.getBoolean("status");
                String categoryName = rs.getString("type");
                boolean categoryStatus = rs.getBoolean("status");
                Category c = new Category(id, categoryName, categoryStatus);
                Item i = new Item(id, name, description, image, quantity, cost, status, c);
                itemList.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return itemList;
    }
    
     public List<Item> getlast() {
        ArrayList<Item> itemList = new ArrayList<>();
        String sql = "select top 4* from item i join category_item c on i.item_category_id = c.item_category_id ORDER BY i.item_id DESC";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("item_id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                float cost = rs.getFloat("cost");
                boolean status = rs.getBoolean("status");
                
                String categoryName = rs.getString("type");
                boolean categoryStatus = rs.getBoolean("status");
                
                Category c = new Category(id, categoryName, categoryStatus);
                Item i = new Item(id, name, description, image, quantity, cost, status, c);
                itemList.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return itemList;
    }       
            

    public Item getItemByIID(int id) {
        String sql = "select * from item i join category_item c on i.item_category_id = c.item_category_id where i.item_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("item_id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                float cost = rs.getFloat("cost");
                boolean status = rs.getBoolean("status");
                String categoryName = rs.getString("type");
                boolean categoryStatus = rs.getBoolean("status");
                Category c = new Category(cid, categoryName, categoryStatus);
                return new Item(cid, name, description, image, quantity, cost, status, c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Item> getSearch(String keyword) {
        ArrayList<Item> list = new ArrayList<>();
        String sql = "select * from item i join category_item c on i.item_category_id = c.item_category_id where i.[name] like ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + keyword + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("item_id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                float cost = rs.getFloat("cost");
                boolean status = rs.getBoolean("status");
                String categoryName = rs.getString("type");
                boolean categoryStatus = rs.getBoolean("status");
                Category c = new Category(cid, categoryName, categoryStatus);
                Item i = new Item(cid, name, description, image, quantity, cost, status, c);
                list.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addItem(String name, String description, String image, int quantity, float cost, boolean status, int cid) {
        String sql = "INSERT INTO item ([name], "
                + "[description], "
                + "[image], "
                + "quantity, "
                + "cost, "
                + "[status], "
                + "item_category_id) VALUES\n"
                + "(?,?,?,?,?,?,?) ";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            pre.setString(2, description);
            pre.setString(3, image);
            pre.setInt(4, quantity);
            pre.setFloat(5, cost);
            pre.setBoolean(6, status);
            pre.setInt(7, cid);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL");
        }
    }

    public void updateItemStatus(String id, boolean status) {
        String sql = "UPDATE item SET status = ? WHERE item_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, status);
            pre.setString(2, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void UpdateItem(String name, String description,String image,int quantity,float cost, int cid,int id) {
        String sql = "UPDATE item SET"
                + "    [name] = ?,\n"
                + "    [description] = ?,\n"
                + "    [image] = ?,\n"
                + "    quantity = ?,\n"
                + "    cost = ?,\n"
                + "    item_category_id = ?"
                + " where item_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            pre.setString(2, description);
            pre.setString(3, image);
            pre.setInt(4,quantity);
            pre.setFloat(5, cost);
            pre.setInt(6, cid);
            pre.setInt(7, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public List<Item> getAllActiveItemWithCategory() {
        List<Item> list = new ArrayList<>();
        String sql = "select * from item i join category_item c on i.item_category_id = c.item_category_id"; 
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("item_id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                float cost = rs.getFloat("cost");
                boolean status = rs.getBoolean("status");
                String categoryName = rs.getString("type");
                boolean categoryStatus = rs.getBoolean("status");
                Category c = new Category(cid, categoryName, categoryStatus);
                Item i = new Item(cid, name, description, image, quantity, cost, status, c);
                list.add(i);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public int getNumberPageItem(){
        String sql = "select count(*) from item";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public List<Item> getPaging(int page, int pageSize){
        List<Item> list = new ArrayList<>();
        String sql = "select * from item i join category_item c on i.item_category_id = c.item_category_id order by i.item_id offset (?-1)*? rows fetch first ? rows only";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, page);
            pre.setInt(2, pageSize);
            pre.setInt(3, pageSize);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                int cid = rs.getInt("item_id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                float cost = rs.getFloat("cost");
                boolean status = rs.getBoolean("status");
                String categoryName = rs.getString("type");
                boolean categoryStatus = rs.getBoolean("status");
                Category c = new Category(cid, categoryName, categoryStatus);
                Item i = new Item(cid, name, description, image, quantity, cost, status, c);
                list.add(i);
            }
                    
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
        

    
    public void updateItemQuantity(int itemId, int quantity){
        String sql = "update item set quantity = quantity - ? where item_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, quantity);
            pre.setInt(2, itemId);
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    

    public static void main(String[] args) {
        ItemDAO item = new ItemDAO();
        
        item.updateItemQuantity(1, 1);

    }
}
