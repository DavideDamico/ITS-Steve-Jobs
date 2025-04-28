package com.example.bankapi.controller;

import com.example.bankapi.model.Utente;
import com.example.bankapi.repository.UtenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UtenteRepository utenteRepository;

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody Utente utente) {
        try {
            utenteRepository.save(utente);
            return ResponseEntity.ok("Utente registrato con successo");
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity
                    .status(HttpStatus.CONFLICT)
                    .body("Errore: username già esistente");
        } catch (Exception e) {
            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Errore interno del server");
        }
    }

    @PostMapping("/login")
    public String login(@RequestBody Utente loginData) {
        Optional<Utente> userOpt = utenteRepository.findByUsername(loginData.getUsername());
        if (userOpt.isPresent() && userOpt.get().getPassword().equals(loginData.getPassword())) {
            return "Login riuscito per utente: " + loginData.getUsername();
        } else {
            return "Credenziali non valide";
        }
    }
}
