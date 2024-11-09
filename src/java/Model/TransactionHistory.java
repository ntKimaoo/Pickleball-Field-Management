/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author TuấnAnh Hà
 */
public class TransactionHistory {
    private int id;
    private String date;
    private int amount;
    private String type;

    public TransactionHistory(int id, String date, int amount, String type) {
        this.id = id;
        this.date = date;
        this.amount = amount;
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public TransactionHistory() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "TransactionHistory{" + "id=" + id + ", date=" + date + ", amount=" + amount + '}';
    }
    
    
    
}
