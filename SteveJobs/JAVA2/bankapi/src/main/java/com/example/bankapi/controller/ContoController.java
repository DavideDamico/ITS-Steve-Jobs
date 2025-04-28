package com.example.bankapi.controller;

import com.example.bankapi.model.ContoBancario;
import com.example.bankapi.model.Utente;
import com.example.bankapi.repository.ContoRepository;
import com.example.bankapi.repository.UtenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/conti")
public class ContoController {
    @Autowired
    private ContoRepository contoRepository;

    @Autowired
    private UtenteRepository utenteRepository;

    // GET tutti i conti
    @GetMapping
    public List<ContoBancario> getAll() {
        return contoRepository.findAll();
    }

    @GetMapping("/utente/{utenteId}")
    public List<ContoBancario> getContiPerUtente(@PathVariable Long utenteId, @RequestParam String username) {
        // Log per diagnosticare il flusso
        System.out.println("Richiesta per i conti dell'utente con ID: " + utenteId + " e username: " + username);
        
        Optional<Utente> utenteOpt = utenteRepository.findByUsername(username);
        
        if (!utenteOpt.isPresent()) {
            // Log se l'utente non viene trovato
            System.out.println("Utente con username " + username + " non trovato");
            throw new RuntimeException("Utente non trovato");
        }
    
        Utente utente = utenteOpt.get();
        
        if (!utente.getId().equals(utenteId)) {
            // Log se l'utente non corrisponde all'ID
            System.out.println("ID utente non corrisponde: " + utente.getId() + " vs " + utenteId);
            throw new RuntimeException("Accesso negato: l'utente non può visualizzare i conti di un altro utente.");
        }
        
        // Restituisce i conti dell'utente
        List<ContoBancario> conti = contoRepository.findByUtenteId(utenteId);
        System.out.println("Conti trovati: " + conti.size());
        
        return conti;
    }
    
    
    // POST per creare un nuovo conto
    @PostMapping("/utente/{utenteId}")
    public String createConto(@PathVariable Long utenteId, @RequestBody ContoBancario conto) {
        Optional<Utente> utenteOpt = utenteRepository.findById(utenteId);
        if (utenteOpt.isPresent()) {
            ContoBancario nuovoConto = new ContoBancario(
                conto.getIntestatario(), conto.getSaldo(), conto.getTipoConto()
            );
            nuovoConto.setUtente(utenteOpt.get()); // Associa l'utente al conto
            contoRepository.save(nuovoConto);
            return "Conto creato per utente ID: " + utenteId;
        } else {
            return "Utente non trovato.";
        }
    }

    // DELETE per ID
    @DeleteMapping("/{id}")
    public String delete(@PathVariable Long id) {
        if (contoRepository.existsById(id)) {
            contoRepository.deleteById(id);
            return "Conto eliminato.";
        } else {
            return "Conto non trovato.";
        }
    }

    // DELETE tutti i conti
    @DeleteMapping("/tutti")
    public String eliminaTuttiIConti() {
        contoRepository.deleteAll();
        return "Tutti i conti sono stati eliminati.";
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getContoPerId(@PathVariable Long id, @RequestParam String username) {
        try {
            Optional<ContoBancario> contoOpt = contoRepository.findById(id);
            if (contoOpt.isPresent()) {
                ContoBancario conto = contoOpt.get();
                System.out.println("Conto trovato: " + conto);
                Optional<Utente> utenteOpt = utenteRepository.findByUsername(username);
                if (utenteOpt.isPresent()) {
                    Utente utente = utenteOpt.get();
                    System.out.println("Utente trovato: " + utente);
                    if (conto.getUtente().getId().equals(utente.getId())) {
                        return ResponseEntity.ok(conto);
                    } else {
                        return ResponseEntity.status(HttpStatus.FORBIDDEN)
                            .body("Accesso negato: non puoi visualizzare il conto di un altro utente.");
                    }
                } else {
                    return ResponseEntity.status(HttpStatus.NOT_FOUND)
                        .body("Utente con username " + username + " non trovato.");
                }
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("Conto con ID " + id + " non trovato.");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body("Errore interno del server: " + e.getMessage());
        }
    }
    

    // Ricerca per intestatario
    @GetMapping("/ricerca")
    public List<ContoBancario> ricercaPerNome(@RequestParam String nome) {
        return contoRepository.findByIntestatarioContainingIgnoreCase(nome);
    }

    // Filtro per tipo conto
    @GetMapping("/tipo")
    public List<ContoBancario> filtraPerTipo(@RequestParam String tipo) {
        return contoRepository.findByTipoConto(tipo);
    }
}
