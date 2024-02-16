package com.example.listClientes.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import org.springframework.boot.autoconfigure.web.WebProperties;

@Entity
@Table(name = "cliente")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClienteModel {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;
        private String nombre;
        private String apellidoUno;
        private String apellidoDos;

}
