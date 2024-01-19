package com.example.empleadoClase.service;

import com.example.empleadoClase.model.Departamento;
import com.example.empleadoClase.repository.DepartamentoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartamentoService {

    @Autowired
    private DepartamentoRepository departamentoRepository;

    public Departamento guardarDepartamento(Departamento departamento){ return departamentoRepository.save(departamento);}

    public List<Departamento> listaDepartamentos(){
        return departamentoRepository.findAll();
    }
}
