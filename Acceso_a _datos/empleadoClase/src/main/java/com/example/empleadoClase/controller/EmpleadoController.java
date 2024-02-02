package com.example.empleadoClase.controller;

import com.example.empleadoClase.dto.ListaEmpleadoDTO;
import com.example.empleadoClase.model.Empleado;
import com.example.empleadoClase.service.EmpleadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin({"*"})
@RestController
@RequestMapping("/api/empleado")
public class EmpleadoController {

    @Autowired
    private EmpleadoService empleadoService;

    @PostMapping
    public Empleado save(Empleado empleado){
        return empleadoService.guardarEmpleado(empleado);
    }

    @GetMapping
    public List<Empleado> list(){
        return empleadoService.listaEmpleado();
    }

    @GetMapping("/lista-dto")
    public List<ListaEmpleadoDTO> listaDTO(){
        return empleadoService.listaEmpleadoDTO();
    }

}
