package com.progetto.biblioteca.dto;

import lombok.Data;

import java.time.LocalDate;
import com.progetto.biblioteca.model.Utente; // Import the Utente class

@Data
public class PrestitoDTO {
    private Long id;
    private Long libroId;
    private String titoloLibro;
    private LocalDate dataInizio;
    private LocalDate dataFine;
    private boolean restituito;

    // Metodo getUtente() per ottenere l'oggetto Utente utente
    public Utente getUtente() {
        // Implementazione del metodo per ottenere l'oggetto Utente
        return new Utente(); // Restituisce un nuovo oggetto Utente (modifica secondo necessità)
    }

    // Metodo getLibro() per ottenere l'oggetto Libro libro
    public Long getLibro() {
        // Implementazione del metodo per ottenere l'oggetto Libro
        return libroId; // Restituisce l'ID del libro (modifica secondo necessità)
    }
    
}
