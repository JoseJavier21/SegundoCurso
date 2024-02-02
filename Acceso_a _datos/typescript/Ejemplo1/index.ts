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

let num1: number = 10
let num2: number = 2.5

// string

let nombre: string = "marta"
let nombre2: string = "julio"

console.log(nombre)

// boolean

let pagado:boolean = true

// null

let dato: null =  null

console.log(dato)

// undefined

let info: string

//console.log(info)


// objeto

let empleado: object = {'nombre': "pepe", "edad": 23}

//console.log(empleado.nombre)

type Persona = {
    nombre: string,
    edad: number
}

let persona: Persona = {
    nombre: "jose",
    edad: 23
}

console.log(persona.edad)

// funciones

// sin parametro y sin retorno

function saludo(): void{
    console.log("hola")
}

saludo()

// sin parametro y con retorno

function multiplicacion(): string{
    return "hola"
}

// con parametro y sin retorno

function bienvenido(message: string): void{
    console.log('Bienvenido/a')
}

// con parametro y con retoro

function getData(num3: number, num4: number): number{
    return num3 + num4
}

console.log(getData(2,6))

console.log(multiplicacion())


// ARRAYS

let numeros: number[] = [23,454,24,425,45.39,245,687,898]

let nombresPersonas: string[] = ["pepe", "alberto", "juan", "antonio"]

for (let i = 0; i < numeros.length; i++) {
    console.log(i)
}

// TUPLAS

let mitupla: [number, string] = [2, "jesus"]

// ENUM 

enum Talla {Pequenua = "s", Mediana = "m", Grande = "l"}

let camiseta: Talla = Talla.Mediana
