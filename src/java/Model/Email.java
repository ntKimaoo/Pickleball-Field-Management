
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Controller.LoginServlet;
import com.sun.mail.imap.IMAPMessage;
import Model.Account;
import Model.Customer;
import dal.AccountDAO;
import dal.CustomerDAO;
import java.io.UnsupportedEncodingException;
import java.net.PasswordAuthentication;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.DataHandler;
import javax.activation.DataSource;

/**
 *
 * @author ADMIN
 */
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import util.GeneratePassword;
import util.MD5Encryptor;

public class Email {

    private String from;

    public Email() {
    }

    public Email(String from) {
        this.from = from;
    }

    public void sendEmailForgetPasswordCustomer(Account a, Customer c) {
        final String from = "tuananhha0504@gmail.com";
        final String pass = "msqg txbu hgoo kagh";
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        Authenticator auth = new Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(from, pass);
            }
        };
        Session session = Session.getInstance(properties, auth);
        String to = c.getEmail();
        MimeMessage msg = new MimeMessage(session);
        String newPassword = new String(GeneratePassword.generatePassword());
        CustomerDAO aDao = new CustomerDAO();
        String passw = "";
         try {
            passw = MD5Encryptor.usingMd5(newPassword);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        aDao.updatePassword(a.getUsername(), newPassword);
        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(new InternetAddress(from));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            msg.setSubject("Change Your Password!");
            String content = "Dear, " + c.getFullName() + ".\n";
            content += "Your username: " + a.getUsername() + ". ";
            content += "Your new password: " + newPassword +  ".\n";
            content += "Best regard!";
            msg.setContent(content, "text/html; charset=UTF-8");
            Transport.send(msg);
            System.out.println("Email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public void sendAccountStaff(Account a, Employee s) {
        final String from = "tuananhha0504@gmail.com";
        final String pass = "msqg txbu hgoo kagh";
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        Authenticator auth = new Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(from, pass);
            }
        };
        Session session = Session.getInstance(properties, auth);
        String to = s.getEmail();
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(new InternetAddress(from));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            msg.setSubject("Confirm register!");
            String content = "Dear, " + s.getFullname() + ".\n";
            content += "\n";
            content += "Thank you for join with us. We are excited to have you on board!\n";
            content += "\n";
            content += "Your username: " + a.getUsername() + ". ";
            content += "\n";
            content += "Your password: " + a.getPassword() + ". ";
            content += "\n";
            content += "Please make sure to keep your password secure and do not share it with anyone.\n";
            content += "\n";
            content += "If you have any questions or need assistance, feel free to contact our support team.\n\n";
            content += "\n";
            content += "Best regard!";
            content += "\n";
            content += "The Pickleball Team\n";
            msg.setContent(content, "text/html; charset=UTF-8");
            Transport.send(msg);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}
