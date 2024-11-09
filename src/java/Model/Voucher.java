/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author kiennn
 */
public class Voucher {
    String code;
    Date expiredate;
    String usecondition;
    int quantity;
    int percent;

    public Voucher(String code, Date expiredate, String usecondition, int quantity, int percent) {
        this.code = code;
        this.expiredate = expiredate;
        this.usecondition = usecondition;
        this.quantity = quantity;
        this.percent = percent;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getExpiredate() {
        return expiredate;
    }

    public void setExpiredate(Date expiredate) {
        this.expiredate = expiredate;
    }

    public String getUsecondition() {
        return usecondition;
    }

    public void setUsecondition(String usecondition) {
        this.usecondition = usecondition;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }
    
}
