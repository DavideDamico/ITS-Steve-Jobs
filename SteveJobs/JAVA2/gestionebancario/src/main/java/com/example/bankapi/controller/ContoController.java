package com.example.bankapi.controller;

import com.example.bankapi.model.ContoBancario;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/conti")
public class ContoController {
    private List<ContoBancario> conti = new ArrayList<>();

    @GetMapping
    public List<ContoBancario> getTuttiIConti() {
        return conti;
    }

    @PostMapping
    public String aggiungiConto(@RequestBody ContoBancario conto) {
        conti.add(conto);
        return "Conto aggiunto con successo.";
    }

    @GetMapping("/{id}")
    public ContoBancario getContoPerId(@PathVariable int id) {
        for (ContoBancario conto : conti) {
            if (conto.getId() == id) return conto;
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public String eliminaConto(@PathVariable int id) {
        for (ContoBancario conto : conti) {
            if (conto.getId() == id) {
                conti.remove(conto);
                return "Conto con ID " + id + " rimosso con successo.";
            }
        }
        return "Conto con ID " + id + " non trovato.";
    }
}
