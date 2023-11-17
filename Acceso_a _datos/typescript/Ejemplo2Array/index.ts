// Metodos principales

// (map) crea un nuevo array y a este se le aplica una funcion pasada por callback al primer array

let numeroos = [2,4,5,6,7,9]

let newArray = numeroos.map(function(n){
    return n * 2
})

//console.log(newArray)

// TS 

let nums: number[] = [2,4,5,6,7,9]

// filter (crea un nuevo array bajo una serie de condiciones)

let personas: Personaa[] = [
    {nombre: 'lucas', edad: 12},
    {nombre: 'marta', edad: 45},
    {nombre: 'jose', edad: 23}
]

/* let personasMayores = personas.filter((persona)=>{
    return persona.edad > 22
}) */

let personasMayores: Personaa[] = personas.filter((per)=>{
    return per.edad > 23
})

//console.log(personasMayores)

interface Personaa{
    nombre: String,
    edad: number
}

//console.log(personasMayores)

// some (devulve true o false si se cumple una deternimada condicion)ç

let peopleExists: boolean = personas.some((per)=>{
    return per.edad == 45
})

//console.log(peopleExists)


// reduce

const serie: number[] = [1,2,3,4,5]

const serieAcumulada: number = serie.reduce((ac,num)=>{
    return ac + num
})

//console.log(serieAcumulada)

const palabrass: string[] = ['hola', 'adios', '!']

const concadenacion: string = palabrass.reduce((ac, pal)=>{
    return ac + pal
})

//console.log(concadenacion)
