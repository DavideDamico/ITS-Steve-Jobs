package com.example.bankapi.model;

public class ContoBancario {
    private int id;
    private String intestatario;
    private double saldo;
    public ContoBancario() {} // costruttore vuoto
    public ContoBancario(int id, String intestatario, double saldo) {
        this.id = id;
        this.intestatario = intestatario;
        this.saldo = saldo;
    }
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getIntestatario() { return intestatario; }
    public void setIntestatario(String intestatario) { this.intestatario = intestatario; }
    public double getSaldo() { return saldo; }
    public void setSaldo(double saldo) { this.saldo = saldo; }
}