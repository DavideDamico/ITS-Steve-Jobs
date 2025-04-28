package com.progetto.biblioteca.security;

import com.progetto.biblioteca.model.Utente;
import com.progetto.biblioteca.repository.UtenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UtenteRepository utenteRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Utente utente = utenteRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("Utente non trovato con email: " + email));

        return User.builder()
                .username(utente.getEmail())
                .password(utente.getPassword())
                .roles(utente.getRuolo().name())
                .build();
    }
}
