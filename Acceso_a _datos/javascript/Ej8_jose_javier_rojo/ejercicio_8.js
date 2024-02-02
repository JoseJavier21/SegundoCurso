let num1 = document.getElementById("number1")
let num2 = document.getElementById("number2")
let opciones = document.getElementById("select")
let container = document.getElementById("resultado")

opciones.addEventListener("click", () =>{

    switch(opciones.value) {
        case "Suma":
            sumar(Number.parseInt(num1.value), Number.parseInt(num2.value))
            break;
        case "Resta":
            resta(num1.value, num2.value)
            break;
        case "Multiplicacion":
            multiplicar(num1.value, num2.value)
            break;
        case "Dividir":
            dividir(num1.value, num2.value)
            break;
        default:
            break;
    }

})




function sumar(numero1, numero2){
    return container.innerHTML = "El resultado de la suma es: " + (numero1 + numero2)
} 

function resta(numero1, numero2,){
    container.innerHTML = "El resultado de la resta es: " + (parseInt(numero1) - parseInt(numero2))
}

function multiplicar(numero1, numero2){
    container.innerHTML = "El resultado de la multiplicacion es: " + (parseInt(numero1) * parseInt(numero2))
}

function dividir(numero1, numero2){
    container.innerHTML = "El resultado de la division es: " + (parseInt(numero1) / parseInt(numero2))
}

