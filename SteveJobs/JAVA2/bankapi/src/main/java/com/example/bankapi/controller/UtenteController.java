package com.example.bankapi.controller;

import com.example.bankapi.model.Utente;
import com.example.bankapi.repository.UtenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/utente")
public class UtenteController {

    @Autowired
    private UtenteRepository utenteRepository;

    @GetMapping("/{username}")
    public Utente getUtenteByUsername(@PathVariable String username) {
        return utenteRepository.findByUsername(username).orElse(null);
    }
}
