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

    public Coche guardarCocheApi(Coche coche) { return cocheRepositorio.save(coche);}

    public Coche searchById(Long id){
        return cocheRepositorio.findById(id).orElse(null);
    }

    public List<Coche> searchByMarca(String marca){
        return cocheRepositorio.findByMarca(marca);
    }

    public List<Coche> searchByModelo(String modelo){
        return cocheRepositorio.findByModelo(modelo);
    }

    public List<Coche> searchByPrecio(Double precio){
        return cocheRepositorio.findByPrecio(precio);
    }

    public void deleteCar(Long id){ cocheRepositorio.deleteById(id);}


}
