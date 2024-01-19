package com.example.empleadoClase.service;

import com.example.empleadoClase.convertes.EmpleadoConverter;
import com.example.empleadoClase.dto.ListaEmpleadoDTO;
import com.example.empleadoClase.model.Empleado;
import com.example.empleadoClase.repository.EmpleadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EmpleadoService {

    @Autowired
    private EmpleadoRepository empleadoRepository;

    @Autowired
    private EmpleadoConverter empleadoConverter;

    public Empleado guardarEmpleado(Empleado empleado) { return empleadoRepository.save(empleado);}

    public List<Empleado> listaEmpleado(){
        return empleadoRepository.findAll();
    }

    public List<ListaEmpleadoDTO> listaEmpleadoDTO(){
        List<Empleado> listaEmpleado = empleadoRepository.findAll();
        List<ListaEmpleadoDTO> listaDTO = new ArrayList<>();

        listaEmpleado.forEach(empleado -> {
            listaDTO.add(empleadoConverter.convertEntityToDTO(empleado));
        });

        return listaDTO;
    }





}
