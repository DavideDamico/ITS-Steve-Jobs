package com.example.bankapi.model;

import jakarta.persistence.*;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class ContoBancario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String intestatario;
    private double saldo;
    private String tipoConto;
    public ContoBancario() {}
    public ContoBancario(String intestatario, double saldo, String tipoConto) {
        this.intestatario = intestatario;
        this.saldo = saldo;
        this.tipoConto = tipoConto;
    }
    public Long getId() { return id; }
    public String getIntestatario() { return intestatario; }
    public void setIntestatario(String intestatario) { this.intestatario = intestatario; }
    public double getSaldo() { return saldo; }
    public void setSaldo(double saldo) { this.saldo = saldo; }
    public String getTipoConto() { return tipoConto; }
    public void setTipoConto(String tipoConto) { this.tipoConto = tipoConto; }

    @ManyToOne
    @JoinColumn(name = "utente_id")
    @JsonBackReference
    private Utente utente;

    public Utente getUtente() { return utente; }
    public void setUtente(Utente utente) { this.utente = utente; }
}