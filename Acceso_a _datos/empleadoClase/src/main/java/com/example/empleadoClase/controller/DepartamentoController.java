package com.example.empleadoClase.controller;

import com.example.empleadoClase.model.Departamento;
import com.example.empleadoClase.service.DepartamentoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin({"*"})
@RestController
@RequestMapping("/api/departamento")
public class DepartamentoController {

    @Autowired
    private DepartamentoService departamentoService;

    @PostMapping
    public Departamento save(@RequestBody Departamento departamento){
        return departamentoService.guardarDepartamento(departamento);
    }

    @GetMapping
    public List<Departamento> list(){
        return departamentoService.listaDepartamentos();
    }

}