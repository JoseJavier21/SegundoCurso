export class Contact{

    private id?: number
    private nombre: string
    private apellido: string
    private telefono: number


    constructor(nombre: string, apellido: string, telefono: number){
        this.nombre = nombre,
        this.apellido = apellido,
        this.telefono = telefono
    }

    
}