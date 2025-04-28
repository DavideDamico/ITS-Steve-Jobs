package com.example.bankapi.model;

import jakarta.persistence.*;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class Utente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String username;
    private String password;

    @OneToMany(mappedBy = "utente", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<ContoBancario> conti;

    public Utente() {}

    public Utente(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Long getId() { return id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public List<ContoBancario> getConti() { return conti; }
    public void setConti(List<ContoBancario> conti) { this.conti = conti; }
}
