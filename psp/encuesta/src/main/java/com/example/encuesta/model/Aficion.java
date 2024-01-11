package com.example.encuesta.model;

import com.example.encuesta.enums.AficionNombre;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "aficiones")
public class Aficion  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;


    @Enumerated(EnumType.STRING)
    private AficionNombre nombreAficion;

    public Aficion(){}

    public Aficion(Integer id, AficionNombre nombreAficion) {
        this.id = id;
        this.nombreAficion = nombreAficion;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public AficionNombre getNombreAficion() {
        return nombreAficion;
    }

    public void setNombreAficion(AficionNombre nombreAficion) {
        this.nombreAficion = nombreAficion;
    }
}
