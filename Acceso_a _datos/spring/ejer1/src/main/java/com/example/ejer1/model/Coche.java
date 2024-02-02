package com.example.ejer1.model;

public class Coche {
 
    private String marca;
    private String modelo;
    private Integer precio;


    public Coche(String marca, String modelo, Integer precio) {
        this.marca = marca;
        this.modelo = modelo;
        this.precio = precio;
    }


    public String getMarca() {
        return this.marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return this.modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public Integer getPrecio() {
        return this.precio;
    }

    public void setPrecio(Integer precio) {
        this.precio = precio;
    }

}
