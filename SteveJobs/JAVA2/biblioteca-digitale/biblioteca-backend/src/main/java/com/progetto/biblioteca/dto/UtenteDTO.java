package com.progetto.biblioteca.dto;

import com.progetto.biblioteca.model.Ruolo;

public class UtenteDTO {

    private Long id;
    private String nome;
    private String email;
    private String password;
    private Ruolo ruolo;

    // Costruttore di default
    public UtenteDTO() {}

    // Costruttore con tutti i campi
    public UtenteDTO(Long id, String nome, String email, String password, Ruolo ruolo) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.password = password;
        this.ruolo = ruolo;
    }

    // Getter e Setter
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Ruolo getRuolo() {
        return ruolo;
    }

    public void setRuolo(Ruolo ruolo) {
        this.ruolo = ruolo;
    }
}
