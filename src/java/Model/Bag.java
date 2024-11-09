/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author TuấnAnh Hà
 */
public class Bag {
    private int id;
    private int customerid;
    private int productid;
    private int amount;

    public Bag() {
    }

    @Override
    public String toString() {
        return "Bag{" + "id=" + id + ", customerid=" + customerid + ", productid=" + productid + ", amount=" + amount + '}';
    }
    

    public Bag(int id, int customerid, int productid, int amount) {
        this.id = id;
        this.customerid = customerid;
        this.productid = productid;
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    
}
