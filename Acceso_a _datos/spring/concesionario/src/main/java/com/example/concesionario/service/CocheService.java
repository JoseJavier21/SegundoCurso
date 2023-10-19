package com.example.concesionario.service;

import com.example.concesionario.models.Coche;
import com.example.concesionario.repositorio.CocheRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CocheService {

    @Autowired
    private CocheRepositorio cocheRepositorio;

    public List<Coche> listaCoche(){
        return cocheRepositorio.findAll();
    }

    public void guardarCoche(Coche coche){
        cocheRepositorio.save(coche);
    }
}
