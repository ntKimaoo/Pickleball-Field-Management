/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author pc
 */
public class MatchHistory {
    private int id;
    private String date;
    private int resultwin, resultlose, betpoint;
    private Field field;
    private Customer player1;
    private Customer player2;
    private Customer winner;

    public MatchHistory() {
    }

    public MatchHistory(int id, String date, int resultwin, int resultlose, int betpoint, Field field, Customer player1, Customer player2, Customer winner) {
        this.id = id;
        this.date = date;
        this.resultwin = resultwin;
        this.resultlose = resultlose;
        this.betpoint = betpoint;
        this.field = field;
        this.player1 = player1;
        this.player2 = player2;
        this.winner = winner;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getResultwin() {
        return resultwin;
    }

    public void setResultwin(int resultwin) {
        this.resultwin = resultwin;
    }

    public int getResultlose() {
        return resultlose;
    }

    public void setResultlose(int resultlose) {
        this.resultlose = resultlose;
    }

    public int getBetpoint() {
        return betpoint;
    }

    public void setBetpoint(int betpoint) {
        this.betpoint = betpoint;
    }

    public Field getField() {
        return field;
    }

    public void setField(Field field) {
        this.field = field;
    }

    public Customer getPlayer1() {
        return player1;
    }

    public void setPlayer1(Customer player1) {
        this.player1 = player1;
    }

    public Customer getPlayer2() {
        return player2;
    }

    public void setPlayer2(Customer player2) {
        this.player2 = player2;
    }

    public Customer getWinner() {
        return winner;
    }

    public void setWinner(Customer winner) {
        this.winner = winner;
    }
    
}