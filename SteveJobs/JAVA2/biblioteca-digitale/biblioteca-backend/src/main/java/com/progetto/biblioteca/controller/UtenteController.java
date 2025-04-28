package com.progetto.biblioteca.controller;

import com.progetto.biblioteca.dto.UtenteDTO;
import com.progetto.biblioteca.model.Utente;
import com.progetto.biblioteca.service.UtenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class UtenteController {

    @Autowired
    private UtenteService utenteService;

    // Registrazione utente
    @PostMapping("/register")
    public void registraUtente(@RequestBody UtenteDTO utenteDTO) {
        // Convertiamo il DTO in entità Utente
        Utente utente = new Utente();
        utente.setNome(utenteDTO.getNome());
        utente.setEmail(utenteDTO.getEmail());
        utente.setPassword(utenteDTO.getPassword());
        utente.setRuolo(utenteDTO.getRuolo());

        // Passiamo l'entità Utente al servizio
        utenteService.registraUtente(utente);
    }

    // Login utente
    @PostMapping("/login")
    public void loginUtente(@RequestBody UtenteDTO utenteDTO) {
        // Simile alla registrazione, dobbiamo passare un oggetto Utente
        Utente utente = new Utente();
        utente.setEmail(utenteDTO.getEmail());
        utente.setPassword(utenteDTO.getPassword());

        // Passiamo l'entità Utente al servizio per il login
        utenteService.loginUtente(utente);
    }
}
