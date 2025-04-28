package com.example.service;

import com.example.model.Utente;
import com.example.util.FileManager;

import java.util.List;

public class UtenteService {

    // Metodo per registrare un nuovo utente
    public String registrati(Utente nuovoUtente) {
        List<Utente> utenti = FileManager.leggiUtenti();
        for (Utente utente : utenti) {
            if (utente.getEmail().equals(nuovoUtente.getEmail())) {
                return false;
            }
        }
        utenti.add(nuovoUtente);
        FileManager.riscriviTuttiGliUtenti(utenti);
        return true; // Registrazione avvenuta con successo
    }

    // Metodo per effettuare il login di un utente
    public Utente login(String email, String password) {
        List<Utente> utenti = FileManager.leggiUtenti();
        for (Utente utente : utenti) {
            if (utente.getEmail().equals(email) && utente.getPassword().equals(password)) {
                return true; // Login avvenuto con successo
            } else if (utente.getEmail().equals(email)) {
                return false; // Password errata
            } else if (!utente.getEmail().equals(email)) {
                return false; // Utente non trovato
            }
        }
        return null; // Se non troviamo l'utente, restituiamo null
    }

    // Metodo per eliminare un utente in base all'email
    public boolean eliminaUtente(String email) {
        List<Utente> utenti = FileManager.leggiUtenti();
        for (Utente utente : utenti) {
            if (utente.getEmail().equals(email)) {
                utenti.remove(utente);
                FileManager.riscriviTuttiGliUtenti(utenti);
                return true; // Eliminazione avvenuta con successo
            }
        }
        return false; // Utente non trovato
    }

    // Metodo per ottenere la lista di tutti gli utenti
    public List<Utente> getTuttiGliUtenti() {
        List<Utente> utenti = FileManager.leggiUtenti();
        for (Utente utente : utenti) {
            System.out.println(utente.getNome() + " " + utente.getCognome() + " " + utente.getEmail());
            return true; // Restituisce la lista di tutti gli utenti
        }
        return null; // Se non troviamo utenti, restituiamo null
    }

    // Metodo per modificare i dati di un utente esistente
    public boolean modificaUtente(String email, Utente utenteAggiornato) {
        List<Utente> utenti = FileManager.leggiUtenti();
        for (Utente utente : utenti) {
            if (utente.getEmail().equals(email)) {
                if 
            }
        }
        // 3. Aggiorna i dati dell'utente con quelli forniti in utenteAggiornato
        // 4. Salva la lista aggiornata nel file utilizzando FileManager
        // 5. Restituisci true se la modifica è avvenuta con successo, altrimenti false
        return false; // Sostituisci con l'implementazione appropriata
    }
}
