import { Component } from '@angular/core';

@Component({
  selector: 'app-ejercicio1',
  templateUrl: './ejercicio1.component.html',
  styleUrls: ['./ejercicio1.component.css']
})
export class Ejercicio1Component {

  num1: string = ""
  num2: string = ""
  resultado: number = 0


  sumar(): void{

    let numeroUno = Number.parseInt(this.num1)
    let numeroDos = Number.parseInt(this.num2)

    let suma = numeroUno + numeroDos
    this.resultado = suma
  

  }
}
