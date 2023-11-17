class Pelicula{

    nombre?: string
    protagonistas?: string[]

    proyectarPelicula(): void{
        console.log(`${this.nombre}` + "esta siendo proyectada")
    }
}

let pelicula = new Pelicula()

pelicula.nombre = "Megalodon"

pelicula.proyectarPelicula()

class Actor{
    nombre: string
    apellido: string

    constructor(nombre:string, apellidos: string){
        this.nombre = nombre
        this.apellido = apellidos
    }

    getNombre(): string{
        return this.nombre
    }
}

let actor = new Actor("Penelope", "Cruz")
let actor2 = new Actor("Robert", "de nilo")

console.log(`El nombre del actor es ${actor2.getNombre()}`)

class Numero{

    private numero: number = 0

    setNumero(numero: number){
        this.numero = numero
    }

    getNumero(): number{
        return this.numero
    }
}

let num = new Numero()
num.setNumero(45)
console.log(num.getNumero())

