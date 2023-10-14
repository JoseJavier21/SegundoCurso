// Funciones

// funciones sin parametro y sin retorno

function suma() {
    console.log(5+5)
}
suma()

const sumaDos = () => {
    console.log(5+6)
}
sumaDos()

// funciones sin parametros y con retorno

function multiplicacion() {
    return 5*5
}

const multiplicacionDos = () => {
    return 6*7
}

let resultadoMulti = multiplicacion()
console.log(resultadoMulti)

let resultadoMultiDos = multiplicacionDos()
console.log(multiplicacionDos())

// funciones con parametros y sin retorno

function division(num1, num2) {
    console.log(num1/num2)
}
division(10,5)

const divisionDos = (num1, num2) => console.log(num1/num2)
divisionDos(9,5)

//funciones con parametros y con retorno

function resto(num1, num2) {
    return num1%num2
}

let resultadoResto = resto(15,3)
console.log(resultadoResto)

const restoDos = (num1,num2) => num1%num2

let resultadoRestoDos = restoDos(42,23)
console.log(resultadoRestoDos)

