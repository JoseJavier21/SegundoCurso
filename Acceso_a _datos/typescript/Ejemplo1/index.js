"use strict";
// tipos de variables
// nativas de js
/*
    number (datos numericos, incluye entereos y decimales)
    string (cadena de texto)
    boolean (valor de verbal - true o false)
    null (cuando una variable apunta a un objeto pero no inicializada)
    object (objetos)
    function
*/
// nativas de ts
/*
    any      Estos tres son muy similares y es cuando no sabemos el tipo
    unknow
    never

    arrays (para almacenar diferentes valores)
    tuplas (para almacenar diferentes valores pero teniendo en cuenta una estructura)
    enum (utilizar una serie de constantes dentro de una variable)
*/
// numeros
let num1 = 10;
let num2 = 2.5;
// string
let nombre = "marta";
let nombre2 = "julio";
console.log(nombre);
// boolean
let pagado = true;
// null
let dato = null;
console.log(dato);
// undefined
let info;
//console.log(info)
// objeto
let empleado = { 'nombre': "pepe", "edad": 23 };
let persona = {
    nombre: "jose",
    edad: 23
};
console.log(persona.edad);
// funciones
// sin parametro y sin retorno
function saludo() {
    console.log("hola");
}
saludo();
// sin parametro y con retorno
function multiplicacion() {
    return "hola";
}
// con parametro y sin retorno
function bienvenido(message) {
    console.log('Bienvenido/a');
}
// con parametro y con retoro
function getData(num3, num4) {
    return num3 + num4;
}
console.log(getData(2, 6));
console.log(multiplicacion());
// ARRAYS
let numeros = [23, 454, 24, 425, 45.39, 245, 687, 898];
let nombresPersonas = ["pepe", "alberto", "juan", "antonio"];
for (let i = 0; i < numeros.length; i++) {
    console.log(i);
}
// TUPLAS
let mitupla = [2, "jesus"];
// ENUM 
var Talla;
(function (Talla) {
    Talla["Pequenua"] = "s";
    Talla["Mediana"] = "m";
    Talla["Grande"] = "l";
})(Talla || (Talla = {}));
let camiseta = Talla.Mediana;
