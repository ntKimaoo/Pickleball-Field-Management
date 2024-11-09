/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

/**
 *
 * @author thang
 */
import Model.Account;
import dal.AccountDAO;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

public class TimeoutLogout implements HttpSessionListener {

    public void sessionCreated(HttpSessionEvent event) {

    }

    public void sessionDestroyed(HttpSessionEvent event) {
        //write your logic
        HttpSession session = event.getSession();
        AccountDAO adao = new AccountDAO();
        Account a=(Account) session.getAttribute("user");
        adao.offline(adao.getAccountByUsername(a.getUsername()));
    }
}
