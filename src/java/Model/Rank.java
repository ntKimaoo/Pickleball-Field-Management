/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author pc
 */
public class Rank {
    private int rank_id;
    private String rank_name;
    private int min_point;
    private String img;

    public Rank() {
    }

    public Rank(int rank_id, String rank_name, int min_point, String img) {
        this.rank_id = rank_id;
        this.rank_name = rank_name;
        this.min_point = min_point;
        this.img = img;
    }

    public int getRank_id() {
        return rank_id;
    }

    public void setRank_id(int rank_id) {
        this.rank_id = rank_id;
    }

    public String getRank_name() {
        return rank_name;
    }

    public void setRank_name(String rank_name) {
        this.rank_name = rank_name;
    }

    public int getMin_point() {
        return min_point;
    }

    public void setMin_point(int min_point) {
        this.min_point = min_point;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
}
