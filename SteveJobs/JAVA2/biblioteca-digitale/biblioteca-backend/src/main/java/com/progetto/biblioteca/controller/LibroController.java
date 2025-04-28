package com.progetto.biblioteca.controller;

import com.progetto.biblioteca.model.Libro;
import com.progetto.biblioteca.service.LibroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/admin/libri")
public class LibroController {

    @Autowired
    private LibroService libroService;

    // Endpoint per aggiungere un nuovo libro
    @PostMapping
    public ResponseEntity<Libro> aggiungiLibro(@RequestBody Libro libro) {
        Libro libroCreato = libroService.aggiungiLibro(libro);
        return new ResponseEntity<>(libroCreato, HttpStatus.CREATED);
    }

    // Endpoint per modificare un libro esistente
    @PutMapping("/{id}")
    public ResponseEntity<Libro> modificaLibro(@PathVariable Long id, @RequestBody Libro libro) {
        Libro libroModificato = libroService.modificaLibro(id, libro).orElse(null);
        if (libroModificato != null) {
            return new ResponseEntity<>(libroModificato, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Endpoint per eliminare un libro
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminaLibro(@PathVariable Long id) {
        try {
            libroService.eliminaLibro(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Endpoint per ottenere l'elenco di tutti i libri
    @GetMapping
    public ResponseEntity<List<Libro>> getAllLibri() {
        List<Libro> libri = libroService.getAllLibri();
        return new ResponseEntity<>(libri, HttpStatus.OK);
    }
}
