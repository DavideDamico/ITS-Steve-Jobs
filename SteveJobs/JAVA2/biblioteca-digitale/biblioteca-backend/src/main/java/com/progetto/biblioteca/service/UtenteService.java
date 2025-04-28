package com.progetto.biblioteca.service;

import com.progetto.biblioteca.model.Utente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.progetto.biblioteca.repository.UtenteRepository;
import com.progetto.biblioteca.security.JwtUtils;

@Service
public class UtenteService {

    @Autowired
    private UtenteRepository utenteRepository;

    // Metodo per registrare un utente
    public void registraUtente(Utente utente) {
        // Salviamo l'utente nel database
        utenteRepository.save(utente);
    }

    // Metodo per il login dell'utente
    public void loginUtente(Utente utente) {
        // Logica di login (verifica password, autenticazione JWT, ecc.)
        Utente utenteEsistente = utenteRepository.findByEmail(utente.getEmail())
                .orElseThrow(() -> new IllegalArgumentException("Utente non trovato con l'email fornita"));
        if (utenteEsistente == null || !utenteEsistente.getPassword().equals(utente.getPassword())) {
            throw new IllegalArgumentException("Email o password non validi");
        }
        // Generazione di un token JWT (esempio semplificato)
        JwtUtils jwtUtils = new JwtUtils();
        String token = jwtUtils.generateToken(utenteEsistente.getEmail());
        System.out.println("Login effettuato con successo. Token: " + token);
    }

        public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
            Utente utente = utenteRepository.findByEmail(username)
                    .orElseThrow(() -> new UsernameNotFoundException("User not found with username: " + username));
            return org.springframework.security.core.userdetails.User.builder()
                    .username(utente.getEmail())
                    .password(utente.getPassword())
                    .roles("USER") // You can customize roles based on your application's needs
                    .build();
        }
}
