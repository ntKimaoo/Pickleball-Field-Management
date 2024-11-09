/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author TuấnAnh Hà
 */
public class Product {
    private int id;
    private String name;
    private String image;
    private int price;
    private int memberid;
    private int amount;

    public Product() {
    }

    public Product(int id, String name, String image, int price, int memberid) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.memberid = memberid;
    }

    public Product(int id, String name, String image, int price, int memberid, int amount) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.memberid = memberid;
        this.amount = amount;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getMemberid() {
        return memberid;
    }

    public void setMemberid(int memberid) {
        this.memberid = memberid;
    }

    
    
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    
    
    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", image=" + image + ", price=" + price + '}';
    }
    
    
}
