package com.progetto.biblioteca.model;

import jakarta.persistence.*;
import lombok.*;
import java.util.List;

@Entity
@Table(name = "utenti")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Utente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    @Column(unique = true, nullable = false)
    private String email;

    @Column(nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Ruolo ruolo;

    // In futuro: relazione con la lista di prestiti dell'utente
    @OneToMany(mappedBy = "utente")
    private List<Prestito> prestiti;

    //Metodo getEmail() per ottenere l'email dell'utente
    public String getEmail() {
        return email;
    }

    //Metodo getRuolo() per ottenere il ruolo dell'utente
    public Ruolo getRuolo() {
        return ruolo;
    }

    //Metodo getId() per ottenere l'id dell'utente
    public Long getId() {
        return id;
    }

    //Metodo getNome() per ottenere il nome dell'utente
    public String getNome() {
        return nome;
    }

    //Metodo getPassword() per ottenere la password dell'utente
    public String getPassword() {
        return password;
    }

    //Metodo getPrestiti() per ottenere la lista dei prestiti dell'utente
    public List<Prestito> getPrestiti() {
        return prestiti;
    }

    //Metodo setEmail() per impostare l'email dell'utente
    public void setEmail(String email) {
        this.email = email;
    }

    //Metodo setRuolo() per impostare il ruolo dell'utente
    public void setRuolo(Ruolo ruolo) {
        this.ruolo = ruolo;
    }

    //Metodo setId() per impostare l'id dell'utente
    public void setId(Long id) {
        this.id = id;
    }

    //Metodo setNome() per impostare il nome dell'utente
    public void setNome(String nome) {
        this.nome = nome;
    }

    //Metodo setPassword() per impostare la password dell'utente
    public void setPassword(String password) {
        this.password = password;
    }

    //Metodo setPrestiti() per impostare la lista dei prestiti dell'utente
    public void setPrestiti(List<Prestito> prestiti) {
        this.prestiti = prestiti;
    }
}
