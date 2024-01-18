package com.example.empleadoClase.convertes;

import com.example.empleadoClase.dto.ListaEmpleadoDTO;
import com.example.empleadoClase.model.Empleado;
import jakarta.persistence.Converter;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class EmpleadoConverter {



    public ListaEmpleadoDTO convertEntityToDTO(Empleado empleado){
        ListaEmpleadoDTO listaEmpleadoDTO = new ListaEmpleadoDTO();

        listaEmpleadoDTO.setNombreEmpleado(empleado.getNombre());
        listaEmpleadoDTO.setApellidos(empleado.getApellidoUno() + " " + empleado.getApellidoDos());
        listaEmpleadoDTO.setDepartamentoEmpleado(empleado.getDepartamento().getNombreDepartamento());

        return listaEmpleadoDTO;
    }

}
