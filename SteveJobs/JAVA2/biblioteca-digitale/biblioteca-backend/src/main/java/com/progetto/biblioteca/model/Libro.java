package com.progetto.biblioteca.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Libro {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String titolo;
    private String autore;
    private String genere;
    private int annoPubblicazione;
    private int copieDisponibili;

    @OneToMany(mappedBy = "libro", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Prestito> prestiti;

    // Metodo setId(Long id)
    public void setId(Long id) {
        this.id = id;
    }

    // Metodo getId()
    public Long getId() {
        return id;
    }
}
