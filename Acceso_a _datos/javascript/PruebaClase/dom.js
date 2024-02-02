
let btGuardar = document.getElementById("btGuardar")
let btConsultar = document.getElementById("btConsultar")
let btModificar = document.getElementById("btModificar")
let btEliminar = document.getElementById("btEliminar")


btGuardar.addEventListener('click', function(){

    alert("Guardando...")
})

btConsultar.addEventListener('click', function(){
    alert("Consultando...")
})

btModificar.addEventListener('click', function(){
    alert("Modificando...")
})

btEliminar.addEventListener('click', () => {
    alert("Eliminando...")
})

// Buscador

let busqueda = document.getElementById("resultadoBusqueda")
let nombre = document.getElementById("nombre")

nombre.addEventListener('keyup', () => { // evento cuando la tecla es pulsada pero reaccionar cuando la dejas

    if(nombre.value == "pepe"){
        busqueda.innerHTML = nombre.value
    }else{
        busqueda.textContent = "Sin Resultados"
    }
})

// Formulario de registro

let marca = document.getElementById("marca")
let modelo = document.getElementById("modelo")
let form = document.getElementById("form")
let datos = document.getElementById("datosCoche")

form.addEventListener('submit', (evento) => {
    evento.preventDefault()
    datos.innerHTML = marca.value + " - " + modelo.value
})


// Desplegable paises

let paises = document.querySelector("select")
let paisesForm = document.getElementById("paisesForm")

const getForm = () =>{

    paisesForm.addEventListener('submit', (evento) =>{
        evento.preventDefault()
        
        switch (paises.value) {
            case '1':
                console.log("España")
                break;
            case '2': 
                console.log("Francia")
                break;
            case '3': 
                console.log("Portugal")
                break;
            case '4':
                console.log("Andorra")
                break;
            default:
                console.log("Opcion Incorrecta")
                break;
        }
    })
}

const getCountry = () => {
    paises.addEventListener('change', () => {
        
        switch (paises.value) {
            case '1':
                console.log("España")
                break;
            case '2': 
                console.log("Francia")
                break;
            case '3': 
                console.log("Portugal")
                break;
            case '4':
                console.log("Andorra")
                break;
            default:
                console.log("Opcion Incorrecta")
                break;
        }
    })

}

getForm()
 

