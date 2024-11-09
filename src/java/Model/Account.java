/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author pc
 */
public class Account {

    private String username;
    private String password;
    private String role;
    private String created_date;
    private boolean isActived, Online;

    public Account(String username) {
        this.username = username;
    }

    public Account() {
    }

    public Account(String username, String password, String role, String created_date, boolean isActived, boolean Online) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.created_date = created_date;
        this.isActived = isActived;
        this.Online = Online;
    }
    public Account(String username, String role, String created_date, boolean isActived, boolean Online) {
        this.username = username;
        this.role = role;
        this.created_date = created_date;
        this.isActived = isActived;
        this.Online = Online;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public void setOnline(boolean Online) {
        this.Online = Online;
    }

    public boolean isOnline() {
        return Online;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public void setIsActived(boolean isActived) {
        this.isActived = isActived;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getCreated_date() {
        return created_date;
    }

    public boolean isIsActived() {
        return isActived;
    }
}
