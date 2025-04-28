package com.progetto.biblioteca.dto;

import lombok.Data;

@Data
public class LibroDTO {
    private Long id;
    private String titolo;
    private String autore;
    private String genere;
    private int annoPubblicazione;
    private int copieDisponibili;
}
