/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author thang
 */
public class Customer extends Account{
    private int id;private String FullName,Email,Phone,Address,NickName;
    private Integer Point;
    private Rank rank;

    public Rank getRank() {
        return rank;
    }

    public void setRank(Rank rank) {
        this.rank = rank;
    }

    public Customer(int id, String FullName, String Email, String Phone, String Address, Integer Point, Rank rank, String username) {
        super(username);
        this.id = id;
        this.FullName = FullName;
        this.Email = Email;
        this.Phone = Phone;
        this.Address = Address;
        this.Point = Point;
        this.rank = rank;
    }

    

    
    public Customer(int id, String FullName, String Email, String Phone, String Address, String NickName, Integer Point) {
        this.id = id;
        this.FullName = FullName;
        this.Email = Email;
        this.Phone = Phone;
        this.Address = Address;
        this.NickName = NickName;
        this.Point = Point;
    }
    public Customer( String FullName, String Email, String Phone, String Address, String NickName, Integer Point) {
        this.FullName = FullName;
        this.Email = Email;
        this.Phone = Phone;
        this.Address = Address;
        this.NickName = NickName;
        this.Point = Point;
    }

    public Customer(int id, String FullName, String Email, String Phone, String Address, Integer Point, String username, String password, String role, String created_date, boolean isActived, boolean Online) {
        super(username, password, role, created_date, isActived, Online);
        this.id = id;
        this.FullName = FullName;
        this.Email = Email;
        this.Phone = Phone;
        this.Address = Address;
        this.Point = Point;
    }
    public Customer(String FullName, String Email, String Phone, String Address, Integer Point) {
        this.FullName = FullName;
        this.Email = Email;
        this.Phone = Phone;
        this.Address = Address;
        this.Point = Point;
    }
    
    public Customer(int id, String FullName,String NickName, String Email, String Phone, String Address, Integer Point, String username, String role, String created_date, boolean isActived, boolean Online) {
        super(username, role, created_date, isActived, Online);
        this.id = id;
        this.FullName = FullName;
        this.NickName = NickName;
        this.Email = Email;
        this.Phone = Phone;
        this.Address = Address;
        this.Point = Point;
    }
    public Customer(int id, String FullName, String Email, String Phone, String Address, Integer Point) {
        this.id = id;
        this.FullName = FullName;
        this.Email = Email;
        this.Phone = Phone;
        this.Address = Address;
        this.Point = Point;
    }
    public Customer() {
    }
    
    public void setNickName(String NickName) {
        this.NickName = NickName;
    }

    public String getNickName() {
        return NickName;
    }

    

    public String getFullName() {
        return FullName;
    }

    public String getEmail() {
        return Email;
    }

    public String getPhone() {
        return Phone;
    }

    public String getAddress() {
        return Address;
    }

    public Integer getPoint() {
        return Point;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public void setPoint(Integer Point) {
        this.Point = Point;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
