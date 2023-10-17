// Variables

// Variables de tipo cadena(String)

let nombre = "hola"
console.log(nombre, "Tipo de variables " + typeof(nombre))

//Variable de tipo Numerico (Number)

let numero = 10
console.log(numero, "Tipo de variable " + typeof(numero))

let decimal = 10.10
console.log(decimal, "Tipo de variable " + typeof(decimal))

//Variable de tipo boolenan (Boolean)
let pagado = true
console.log(pagado, "Tipo de varibale " + typeof(pagado))

//Variables de tipo array (objet - array)

let valores = [23, "hola", true, 23.3]
console.log(valores, "Tipo de variable " + typeof(valores))

//Variables de tipo Objeto (object)
let persona = {
    'nombre': "Pepe",
    'email': "pepe@gmail.com",
    'edad': 32
}
console.log(persona, "Tipo de variables " + typeof(persona))

console.log("nombre: " + persona.nombre)
console.log("edad: " + persona.edad)
console.log("email: " + persona.email)

// Variable de tipo nulo (null)

let nombrePersona = null
console.log(nombrePersona, "Tipo de variable " + typeof(nombrePersona))

//Varible de tipo Indefinido (undefined)7
let variable
console.log(variable, "Tipo de variable " + typeof(variable))

// reasignacion de variables
let nom = "pepe"
console.log(nom)

nom = "jose"
console.log(nom)

// no se puede redeclarar variables
//let nom = "alberto"

// Constantes 

// valores fijos (inmutables)ç

const email = "juan@gmadf.es"

console.log(email)

email = "pepeito@nfng.com"
console.log(email)

