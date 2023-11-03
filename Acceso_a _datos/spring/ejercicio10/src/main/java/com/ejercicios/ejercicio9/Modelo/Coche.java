package com.ejercicios.ejercicio9.Modelo;

import jakarta.persistence.*;

@Entity
@Table("coches")
public class Coche {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String marca;

    private String modelo;

    private Double precio;

}
