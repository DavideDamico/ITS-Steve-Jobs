package com.example.model;

public class Libro {
    private String titolo;
    private String autore;
    private String genere;
    private String annoPubblicazione;
    private String copieDisponibili;

    public Libro(String titolo, String autore, String genere, String annoPubblicazione, String copieDisponibili) {
        this.titolo = titolo;
        this.autore = autore;
        this.genere = genere;
        this.annoPubblicazione = annoPubblicazione;
        this.copieDisponibili = copieDisponibili;
    }

    public String getTitolo() {
        return titolo;
    }

    public String setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public String getAutore() {
        return autore;
    }

    public String setAutore(String autore) {
        this.autore = autore;
    }

    public String getGenere() {
        return genere;
    }

    public String setGenere(String genere) {
        this.genere = genere;
    }

    public String getAnnoPubblicazione() {
        return annoPubblicazione;
    }

    public String setAnnoPubblicazione(String annoPubblicazione) {
        this.annoPubblicazione = annoPubblicazione;
    }

    public String getCopieDisponibili() {
        return copieDisponibili;
    }

    public String setCopieDisponibili(String copieDisponibili) {
        this.copieDisponibili = copieDisponibili;
    }
}
