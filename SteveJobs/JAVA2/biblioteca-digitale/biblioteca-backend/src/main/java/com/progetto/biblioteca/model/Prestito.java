package com.progetto.biblioteca.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Prestito {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "utente_id")
    private Utente utente;

    @ManyToOne(optional = false)
    @JoinColumn(name = "libro_id")
    private Libro libro;

    private LocalDate dataInizio;

    private LocalDate dataFine;

    private boolean restituito;

    // Metodo setUtente(Utente utente)
    public void setUtente(Utente utente) {
        this.utente = utente;
    }

    // Metodo getUtente()
    public Utente getUtente() {
        return utente;
    }

    // Metodo setLibro(Libro libro)
    public void setLibro(Libro libro) {
        this.libro = libro;
    }

    // Metodo getLibro()
    public Libro getLibro() {
        return libro;
    }

    //Metodo setDataInizio(LocalDate dataInizio)
    public void setDataInizio(LocalDate dataInizio) {
        this.dataInizio = dataInizio;
    }
}
