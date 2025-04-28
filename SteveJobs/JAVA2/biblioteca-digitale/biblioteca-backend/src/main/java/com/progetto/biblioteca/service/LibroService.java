package com.progetto.biblioteca.service;

import com.progetto.biblioteca.model.Libro;
import com.progetto.biblioteca.repository.LibroRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LibroService {

    @Autowired
    private LibroRepository libroRepository;

    // Metodo per aggiungere un nuovo libro
    public Libro aggiungiLibro(Libro libro) {
        return libroRepository.save(libro);
    }

    // Metodo per modificare un libro esistente
    public Optional<Libro> modificaLibro(Long id, Libro libroModificato) {
        Optional<Libro> libroEsistente = libroRepository.findById(id);
        if (libroEsistente.isPresent()) {
            libroModificato.setId(id);
            return Optional.of(libroRepository.save(libroModificato));
        }
        return Optional.empty();
    }

    // Metodo per eliminare un libro
    public void eliminaLibro(Long id) {
        libroRepository.deleteById(id);
    }

    // Metodo getAllLibri per ottenere l'elenco di tutti i libri
    public List<Libro> getAllLibri() {
        return libroRepository.findAll();
    }

    // Metodo per trovare un libro per ID
    public Optional<Libro> trovaLibroPerId(Long id) {
        return libroRepository.findById(id);
    }
}
