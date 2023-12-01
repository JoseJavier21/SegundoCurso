import { Component } from '@angular/core';

@Component({
  selector: 'app-ejercicio2',
  templateUrl: './ejercicio2.component.html',
  styleUrls: ['./ejercicio2.component.css']
})
export class Ejercicio2Component {


  alimentos: string[] = []
  alimento:string = ""
  limpiar: boolean = false


  agregarAlimento():void {

    this.limpiar = false
    this.alimentos.push(this.alimento)
    this.alimento = ""

  }

  limpiarLista():void {
    this.alimentos = []
    this.limpiar = true
  }
}
