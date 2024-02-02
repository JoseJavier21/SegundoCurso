import { Component } from '@angular/core';

@Component({
  selector: 'app-ejercicio3',
  templateUrl: './ejercicio3.component.html',
  styleUrls: ['./ejercicio3.component.css']
})
export class Ejercicio3Component {

  texto: string = ""
  color: string = "negro"

  verde:boolean = false
  azul:boolean = false
  rojo:boolean = false

  setVerde():void{
    this.color = "green"
  }


  setAzul():void{
    this.color = "blue"
  }


  setRojo():void{
    this.color = "red"
  }



}
