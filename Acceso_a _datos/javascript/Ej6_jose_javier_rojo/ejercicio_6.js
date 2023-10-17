let input = document.getElementById("palabra")
let texto = document.getElementById("texto")

input.addEventListener("keyup", () =>{

    if (input.value == "Eureka") {
        texto.innerHTML = "¡Has encontrado la palabra clase!"
    }else{
        texto.innerHTML = "Palabra no encontrada"
    }

})

