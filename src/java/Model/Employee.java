/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author kiennn
 */
public class Employee extends Account {

    int id;
    String fullname;
    String email;
    String phonenumber;
    String address;
    int baseid;

    public Employee(int id, String fullname, String email, String phonenumber, String address, int baseid, String username, String password, String role, String created_date, boolean isActived, boolean Online) {
        super(username, password, role, created_date, isActived, Online);
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.phonenumber = phonenumber;
        this.address = address;
        this.baseid = baseid;
    }

    public Employee(String fullname, String email, String phonenumber, String address, int baseid) {
        this.fullname = fullname;
        this.email = email;
        this.phonenumber = phonenumber;
        this.address = address;
        this.baseid = baseid;
    }

    public Employee(int id, String fullname, String email, String phonenumber, String address, int baseid) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.phonenumber = phonenumber;
        this.address = address;
        this.baseid = baseid;
    }

    public Employee() {
    }

    public Employee(int id, String fullname, String email, String phonenumber, String address, int baseid, String username, String role, String created_date, boolean isActived, boolean Online) {
        super(username, role, created_date, isActived, Online);
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.phonenumber = phonenumber;
        this.address = address;
        this.baseid = baseid;
    }

    public Employee(String fullname, String email, String phonenumber, String address, int baseid, String username, String password, String role, String created_date, boolean isActived, boolean Online) {
        super(username, password, role, created_date, isActived, Online);
        this.fullname = fullname;
        this.email = email;
        this.phonenumber = phonenumber;
        this.address = address;
        this.baseid = baseid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getAddress() {
        return address;
    }

    public int getBaseid() {
        return baseid;
    }

    public void setBaseid(int baseid) {
        this.baseid = baseid;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
