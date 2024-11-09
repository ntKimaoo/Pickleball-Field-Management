/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author thang
 */
public class Field {

    private int Id, cost;
    private String Status;
    private boolean Viponly;
    private String base;
    private String image;
    
    public Field() {
    }
    public Field(int Id, int cost, String Status, boolean Viponly, String image) {
        this.Id = Id;
        this.cost = cost;
        this.Status = Status;
        this.Viponly = Viponly;
        this.image = image;
    }

    public Field(int Id, int cost, String Status, boolean Viponly, String base, String image) {
        this.Id = Id;
        this.cost = cost;
        this.Status = Status;
        this.Viponly = Viponly;
        this.base = base;
        this.image = image;
    }

    public int getId() {
        return Id;
    }

    public int getCost() {
        return cost;
    }

    public String getStatus() {
        return Status;
    }

    public boolean isViponly() {
        return Viponly;
    }

    public String getBase() {
        return base;
    }

    public String getImage() {
        return image;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public void setViponly(boolean Viponly) {
        this.Viponly = Viponly;
    }

    public void setBase(String base) {
        this.base = base;
    }

    public void setImage(String image) {
        this.image = image;
    }

   

}
