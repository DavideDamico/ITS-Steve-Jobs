package com.example.model;

public class Prestito {
    private Utente utente;
    private Libro libro;
    private String dataInizioPrestito;
    private String dataFinePrestito;
    private boolean restituito;

    public Prestito(Utente utente, Libro libro, String dataInizioPrestito, String dataFinePrestito) {
        this.utente = utente;
        this.libro = libro;
        this.dataInizioPrestito = dataInizioPrestito;
        this.dataFinePrestito = dataFinePrestito;
        this.restituito = false;
    }

    public Utente getUtente() {
        return utente;
    }

    public void setUtente(Utente utente) {
        this.utente = utente;
    }

    public Libro getLibro() {
        return libro;
    }

    public void setLibro(Libro libro) {
        this.libro = libro;
    }

    public String getDataInizioPrestito() {
        return dataInizioPrestito;
    }

    public void setDataInizioPrestito(String dataInizioPrestito) {
        this.dataInizioPrestito = dataInizioPrestito;
    }

    public String getDataFinePrestito() {
        return dataFinePrestito;
    }

    public void setDataFinePrestito(String dataFinePrestito) {
        this.dataFinePrestito = dataFinePrestito;
    }

    public boolean isRestituito() {
        return restituito;
    }

    public void setRestituito(boolean restituito) {
        this.restituito = restituito;
    }
}
