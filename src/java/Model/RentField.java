/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author kiennn
 */
public class RentField {
    private String Id, Fieldid,Customerid,Date,Time,Voucher;

    public RentField(String Id, String Fieldid, String Customerid, String Date, String Time, String Voucher) {
        this.Id = Id;
        this.Fieldid = Fieldid;
        this.Customerid = Customerid;
        this.Date = Date;
        this.Time = Time;
        this.Voucher = Voucher;
    }

   

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public RentField() {
    }

    public String getFieldid() {
        return Fieldid;
    }

    public void setFieldid(String Fieldid) {
        this.Fieldid = Fieldid;
    }

    public String getCustomerid() {
        return Customerid;
    }

    public void setCustomerid(String Customerid) {
        this.Customerid = Customerid;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public String getTime() {
        return Time;
    }

    public void setTime(String Time) {
        this.Time = Time;
    }

    public String getVoucher() {
        return Voucher;
    }

    public void setVoucher(String Voucher) {
        this.Voucher = Voucher;
    }
    
}
