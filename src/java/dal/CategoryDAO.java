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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAllCategory() {
        ArrayList<Category> categoryList = new ArrayList<>();
        String sql = "select * from category_item";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("item_category_id");
                String name = rs.getString("type");
                boolean status = rs.getBoolean("status");
                Category c = new Category(id, name, status);
                categoryList.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return categoryList;
    }

    public List<Item> getItemByCID(int id) {
        ArrayList<Item> itemList = new ArrayList<>();
        String sql = "select * from item i join category_item c on i.item_category_id = c.item_category_id where c.item_category_id = ?";
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
                Item i = new Item(cid, name, description, image, quantity, cost, status, c);
                itemList.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return itemList;
    }

    public void updateCategoryStatus(String id, boolean status) {
        String sql = "UPDATE category_item SET status = ? WHERE item_category_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, status);
            pre.setString(2, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addCategory(String name, boolean status) {
        String sql = "INSERT INTO category_item ([type], [status]) VALUES\n"
                + "(?, ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            pre.setBoolean(2, status);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Item> getStatus(boolean status) {
        ArrayList<Item> statusList = new ArrayList<>();
        String sql = "select * from item i join category_item c on i.item_category_id = c.item_category_id where i.[status] = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, status);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("item_id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                float cost = rs.getFloat("cost");
                boolean itemstatus = rs.getBoolean("status");
                String categoryName = rs.getString("type");
                boolean categoryStatus = rs.getBoolean("status");
                Category c = new Category(cid, categoryName, categoryStatus);
                Item i = new Item(cid, name, description, image, quantity, cost, itemstatus, c);
                statusList.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return statusList;
    }

    public List<Category> getStatusCategory(boolean status) {
        ArrayList<Category> statusList = new ArrayList<>();
        String sql = "select * from category_item where [status] = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, status);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("item_category_id");
                String categoryName = rs.getString("type");
                boolean categoryStatus = rs.getBoolean("status");
                Category c = new Category(cid, categoryName, categoryStatus);
                statusList.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return statusList;
    }

    public List<Item> getStatusById(int id, boolean status) {
        ArrayList<Item> statusList = new ArrayList<>();
        String sql = "select * from item i join category_item c on i.item_category_id = c.item_category_id where i.item_category_id = ? and i.status = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.setBoolean(2, status);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("item_id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                float cost = rs.getFloat("cost");
                boolean itemstatus = rs.getBoolean("status");
                String categoryName = rs.getString("type");
                boolean categoryStatus = rs.getBoolean("status");
                Category c = new Category(cid, categoryName, categoryStatus);
                Item i = new Item(cid, name, description, image, quantity, cost, status, c);
                statusList.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return statusList;
    }

    public int getNumberPageItem() {
        String sql = "select count(*) from category_item";
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

    public List<Category> getPaging(int page, int pageSize) {
        List<Category> list = new ArrayList<>();
        String sql = "select * from category_item order by item_category_id offset (?-1)*? rows fetch first ? rows only";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, page);
            pre.setInt(2, pageSize);
            pre.setInt(3, pageSize);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("item_category_id");
                String categoryName = rs.getString("type");
                boolean categoryStatus = rs.getBoolean("status");
                Category c = new Category(cid, categoryName, categoryStatus);
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    

    public static void main(String[] args) {
        CategoryDAO c = new CategoryDAO();

    }
}
