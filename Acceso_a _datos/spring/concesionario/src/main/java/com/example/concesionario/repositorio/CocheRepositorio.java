package com.example.concesionario.repositorio;

import com.example.concesionario.models.Coche;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CocheRepositorio extends JpaRepository<Coche, Long> {

    List<Coche> findByMarca(String marca);
    List<Coche> findByModelo(String modelo);
    List<Coche> findByPrecio(Double precio);
}
