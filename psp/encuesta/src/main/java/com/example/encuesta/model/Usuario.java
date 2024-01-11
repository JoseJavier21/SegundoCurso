package com.example.encuesta.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.*;

@Entity
@Table(name = "usuarios")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @Column(name = "fecha_registro")
    private Date fechaRegistro;

    @Column(columnDefinition = "TEXT")
    private String observacion;
    private Byte salario;

    private Boolean genero;

    @ManyToMany
    @JoinTable(
            name = "usuarios_aficiones",
            joinColumns = @JoinColumn(name = "usuario_id"),
            inverseJoinColumns = @JoinColumn(name = "aficion_id")
    )
    private Set<Aficion> aficiones = new HashSet<>();

    public Usuario(){}

    public Usuario(Long id, String username, Date fechaRegistro, String observacion, Byte salario, Boolean genero, Set<Aficion> aficiones) {
        this.id = id;
        this.username = username;
        this.fechaRegistro = fechaRegistro;
        this.observacion = observacion;
        this.salario = salario;
        this.genero = genero;
        this.aficiones = aficiones;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public Byte getSalario() {
        return salario;
    }

    public void setSalario(Byte salario) {
        this.salario = salario;
    }

    public Boolean getGenero() {
        return genero;
    }

    public void setGenero(Boolean genero) {
        this.genero = genero;
    }

    public Set<Aficion> getAficiones() {
        return aficiones;
    }

    public void setAficiones(Set<Aficion> aficiones) {
        this.aficiones = aficiones;
    }
}
