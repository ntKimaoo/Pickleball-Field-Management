/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author thang
 */
public class Base {
    private int Id;private String Address;

    public Base(int Id, String Address) {
        this.Id = Id;
        this.Address = Address;
    }

    public Base() {
    }

    public int getId() {
        return Id;
    }

    public String getAddress() {
        return Address;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }
    
}
