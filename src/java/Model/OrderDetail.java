/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author kiennn
 */
public class OrderDetail {
    private int id;
    private int item_id;
    private int quantity;
    private int order_id;
    private double price;

    public OrderDetail(int id, int item_id, int quantity, int order_id) {
        this.id = id;
        this.item_id = item_id;
        this.quantity = quantity;
        this.order_id = order_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public OrderDetail(int id, int item_id, int quantity, int order_id, double price) {
        this.id = id;
        this.item_id = item_id;
        this.quantity = quantity;
        this.order_id = order_id;
        this.price = price;
    }

    public OrderDetail(int item_id, int quantity, int order_id, double price) {
        this.item_id = item_id;
        this.quantity = quantity;
        this.order_id = order_id;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }
    
}
