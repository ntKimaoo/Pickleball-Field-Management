/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author TuấnAnh Hà
 */
public class ValidatePassword {

    public static boolean
            isValidPassword(String password) {

 
        String regex = 
                 "(?=\\S+$).{6,20}$";

    
        Pattern p = Pattern.compile(regex);

     
    
        if (password == null) {
            return false;
        }

     
        Matcher m = p.matcher(password);

        return m.matches();
    }
}
