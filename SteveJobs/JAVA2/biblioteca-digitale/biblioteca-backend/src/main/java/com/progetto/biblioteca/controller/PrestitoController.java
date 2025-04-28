package com.progetto.biblioteca.controller;

import com.progetto.biblioteca.dto.PrestitoDTO;
import com.progetto.biblioteca.model.Prestito;
import com.progetto.biblioteca.service.PrestitoService;
import com.progetto.biblioteca.model.Libro;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/user/prestiti")
public class PrestitoController {

    @Autowired
    private PrestitoService prestitoService;

    // Endpoint per prenotare un libro
    @PostMapping
    public ResponseEntity<Prestito> prenotaLibro(@RequestBody PrestitoDTO prestitoDTO) {
        // Convertiamo il DTO in entità Prestito
        Prestito prestito = new Prestito();
        prestito.setUtente(prestitoDTO.getUtente());
        // Retrieve the Libro object using the ID from prestitoDTO
        Libro libro = prestitoService.trovaLibroPerId(prestitoDTO.getLibro());
        prestito.setLibro(libro);
        prestito.setDataInizio(prestitoDTO.getDataInizio());
        prestito.setDataFine(prestitoDTO.getDataFine());
        prestito.setRestituito(false); // Un prestito appena creato non è restituito

        // Chiamata al servizio per creare il prestito
        Prestito prestitoCreato = prestitoService.creaPrestito(prestito);
        return new ResponseEntity<>(prestitoCreato, HttpStatus.CREATED);
    }

    // Endpoint per restituire un libro
    @PostMapping("/restituisci/{id}")
    public ResponseEntity<Void> restituisciLibro(@PathVariable Long id) {
        String restituito = prestitoService.restituisciLibro(id);
        if ("true".equalsIgnoreCase(restituito)) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Endpoint per ottenere lo storico dei prestiti di un utente
    @GetMapping("/storico/{utenteId}")
    public ResponseEntity<List<Prestito>> getStoricoPrestiti(@PathVariable Long utenteId) {
        List<Prestito> prestiti = prestitoService.trovaPrestitiPerUtente(utenteId);
        return new ResponseEntity<>(prestiti, HttpStatus.OK);
    }
}
