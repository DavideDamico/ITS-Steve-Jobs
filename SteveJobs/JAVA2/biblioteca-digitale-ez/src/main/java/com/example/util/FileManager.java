package com.example.util;

import com.example.model.Utente;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileManager {
    private static final String FILE_PATH = "utenti.txt";

    // Metodo per salvare un nuovo utente nel file
    public static void salvaUtente(Utente utente) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            writer.write(utente.getNome() + ";" +
                         utente.getCognome() + ";" +
                         utente.getEmail() + ";" +
                         utente.getPassword());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Errore durante il salvataggio dell'utente: " + e.getMessage());
        }
    }

    // Legge tutti gli utenti dal file e li restituisce in una lista
    public static List<Utente> leggiUtenti() {
        List<Utente> utenti = new ArrayList<>();
    
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String linea;
            while ((linea = reader.readLine()) != null) {
                String[] dati = linea.split(";");
                if (dati.length == 4) {
                    Utente utente = new Utente(dati[0], dati[1], dati[2], dati[3]);
                    utenti.add(utente);
                }
            }
        } catch (FileNotFoundException e) {
            // Se il file non esiste ancora, restituisco una lista vuota
        } catch (IOException e) {
            System.out.println("Errore durante la lettura del file: " + e.getMessage());
        }
    
        return utenti;
    }

    // Sovrascrive l'intero file con una nuova lista di utenti
    public static void riscriviTuttiGliUtenti(List<Utente> utenti) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Utente utente : utenti) {
                writer.write(utente.getNome() + ";" +
                             utente.getCognome() + ";" +
                             utente.getEmail() + ";" +
                             utente.getPassword());
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Errore durante la scrittura del file: " + e.getMessage());
        }
    }
    
    // Elimina un utente dal file in base all'email
    public static void eliminaUtentePerEmail(String email) {
        List<Utente> utenti = leggiUtenti();
        utenti.removeIf(u -> u.getEmail().equalsIgnoreCase(email));
        riscriviTuttiGliUtenti(utenti);
    }
}
