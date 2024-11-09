/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class Notification {
    private int id;
    private int customerid;
    private String message;
    private boolean is_read;
    private String date;

    public Notification() {
    }

    public Notification(int id, int customerid, String message, boolean is_read, String date) {
        this.id = id;
        this.customerid = customerid;
        this.message = message;
        this.is_read = is_read;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    
    public Notification(int customerid, String message, boolean is_read, String date) {
        this.customerid = customerid;
        this.message = message;
        this.is_read = is_read;
        this.date = date;
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isIs_read() {
        return is_read;
    }

    public void setIs_read(boolean is_read) {
        this.is_read = is_read;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Notification{" + "customerid=" + customerid + ", message=" + message + ", is_read=" + is_read + ", date=" + date + '}';
    }
    
    
}
