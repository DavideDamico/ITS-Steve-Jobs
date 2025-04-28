package com.progetto.biblioteca.service;

import com.progetto.biblioteca.model.Prestito;
import com.progetto.biblioteca.repository.PrestitoRepository;
import com.progetto.biblioteca.repository.LibroRepository;
import com.progetto.biblioteca.model.Libro;
import com.progetto.biblioteca.model.Utente;
import com.progetto.biblioteca.repository.UtenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PrestitoService {

    @Autowired
    private PrestitoRepository prestitoRepository;

    @Autowired
    private LibroRepository libroRepository;

    @Autowired
    private UtenteRepository utenteRepository;

    // Metodo per prenotare un libro
    public String prenotaLibro(Long utenteId, Long libroId) {
        Optional<Utente> utente = utenteRepository.findById(utenteId);
        Optional<Libro> libro = libroRepository.findById(libroId);

        if (utente.isPresent() && libro.isPresent()) {
            if (libro.get().getCopieDisponibili() > 0) {
                Prestito prestito = new Prestito();
                prestito.setUtente(utente.get());
                prestito.setLibro(libro.get());
                prestito.setDataInizio(java.time.LocalDate.now());
                prestito.setDataFine(java.time.LocalDate.now().plusWeeks(2));  // Prestito di 2 settimane
                prestito.setRestituito(false);

                libro.get().setCopieDisponibili(libro.get().getCopieDisponibili() - 1);  // Decrementa copie disponibili
                libroRepository.save(libro.get());
                prestitoRepository.save(prestito);

                return "Prenotazione effettuata con successo!";
            } else {
                return "Nessuna copia disponibile del libro.";
            }
        } else {
            return "Utente o libro non trovato.";
        }
    }

    // Metodo per creare un prestito
    public Prestito creaPrestito(Prestito prestito) {
        // Logic to create a loan, such as saving to the database
        // Assuming the loan is valid and ready to be saved
        return prestitoRepository.save(prestito); // Save the loan and return the saved object
    }

    // Metodo per restituire un libro
    public String restituisciLibro(Long prestitoId) {
        // Logica per restituire un libro
        Prestito prestito = prestitoRepository.findById(prestitoId).orElse(null);
        if (prestito != null) {
            prestito.setRestituito(true);  // Aggiorna lo stato del prestito come restituito
            prestitoRepository.save(prestito);
            return "Libro restituito con successo";
        }
        return "Prestito non trovato";
    }

    // Metodo per trovare un libro per ID
    public Libro trovaLibroPerId(Long libroId) {
        Optional<Libro> libro = libroRepository.findById(libroId);
        return libro.orElse(null);  // Restituisce il libro se trovato, altrimenti null
    }

    // Metodo per ottenere lo storico dei prestiti di un utente
    public List<Prestito> trovaPrestitiPerUtente(Long utenteId) {
        Optional<Utente> utente = utenteRepository.findById(utenteId);
        if (utente.isPresent()) {
            return prestitoRepository.findByUtente(utente.get());
        } else {
            return null;  // O restituisci una lista vuota, a seconda della logica che desideri
        }
    }
}
