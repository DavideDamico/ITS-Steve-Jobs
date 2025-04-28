package com.progetto.biblioteca.repository;

import com.progetto.biblioteca.model.Prestito;
import com.progetto.biblioteca.model.Utente;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PrestitoRepository extends JpaRepository<Prestito, Long> {
    List<Prestito> findByUtente(Utente utente);
    long countByLibroId(Long libroId);
    long countByUtenteId(Long utenteId);
}
