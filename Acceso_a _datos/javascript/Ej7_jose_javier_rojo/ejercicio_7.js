let num1 = document.getElementById("num1")
let num2 = document.getElementById("num2")
let container = document.getElementById("container")
let sumButton = document.getElementById("sumar")

sumButton.addEventListener('click', () =>{

    sumar(num1.value, num2.value)

})


function sumar(numero1, numero2){

    if(parseInt(numero1) == null || parseInt(numero2) == null){

        alert("Los campos son obligatorios")


    }else{
        container.innerHTML = parseInt(numero1) + parseInt(numero2)
    }

}