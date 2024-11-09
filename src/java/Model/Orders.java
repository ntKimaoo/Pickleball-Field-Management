/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author TuấnAnh Hà
 */
public class Orders {
    private int id;
    private int customerid;
    private int total;
    private String date;
    private boolean ispayment;

    public Orders() {
    }

    public Orders(int customerid, int total, String date, boolean ispayment) {
        this.customerid = customerid;
        this.total = total;
        this.date = date;
        this.ispayment = ispayment;
    }

    
    
    public Orders(int id, int customerid, int total, String date, boolean ispayment) {
        this.id = id;
        this.customerid = customerid;
        this.total = total;
        this.date = date;
        this.ispayment = ispayment;
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

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public boolean isIspayment() {
        return ispayment;
    }

    public void setIspayment(boolean ispayment) {
        this.ispayment = ispayment;
    }

    @Override
    public String toString() {
        return "Orders{" + "id=" + id + ", customerid=" + customerid + ", total=" + total + ", date=" + date + ", ispayment=" + ispayment + '}';
    }
    
    
}
