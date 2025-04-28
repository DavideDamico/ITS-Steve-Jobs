package com.example.bankapi.repository;

import com.example.bankapi.model.ContoBancario;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ContoRepository extends JpaRepository<ContoBancario, Long> {
    List<ContoBancario> findByIntestatarioContainingIgnoreCase(String nome);
    List<ContoBancario> findByTipoConto(String tipo);
    List<ContoBancario> findByUtenteId(Long utenteId);

}