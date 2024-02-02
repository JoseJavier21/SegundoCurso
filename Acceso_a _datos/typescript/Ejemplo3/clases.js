"use strict";
class Pelicula {
    proyectarPelicula() {
        console.log(`${this.nombre}` + "esta siendo proyectada");
    }
}
let pelicula = new Pelicula();
pelicula.nombre = "Megalodon";
pelicula.proyectarPelicula();
class Actor {
    constructor(nombre, apellidos) {
        this.nombre = nombre;
        this.apellido = apellidos;
    }
    getNombre() {
        return this.nombre;
    }
}
let actor = new Actor("Penelope", "Cruz");
let actor2 = new Actor("Robert", "de nilo");
console.log(`El nombre del actor es ${actor2.getNombre()}`);
class Numero {
    constructor() {
        this.numero = 0;
    }
    setNumero(numero) {
        this.numero = numero;
    }
    getNumero() {
        return this.numero;
    }
}
let num = new Numero();
num.setNumero(45);
console.log(num.getNumero());
