package com.example.concesionario.repositorio;

import com.example.concesionario.models.Coche;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CocheRepositorio extends JpaRepository<Coche, Long> {
}
