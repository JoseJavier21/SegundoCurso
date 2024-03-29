import { Component } from '@angular/core';
import { Coctel } from 'src/app/model/Coctel';
import { CoctelServiceService } from 'src/app/services/coctel-service.service';

@Component({
  selector: 'app-blue-component',
  templateUrl: './blue-component.component.html',
  styleUrls: ['./blue-component.component.css']
})
export class BlueComponentComponent {

  coctelArr: Coctel = {
      strDrink: '',
      strDrinkThumb: '',
      strIngredient1: '',
      strIngredient2: '',
      strIngredient3: '',
      strIngredient4: '',
      strInstrctionsIT: ''
    }
  

  constructor(private coctelService: CoctelServiceService){}

  ngOnInit(): void {

    this.coctelService.getCoctel("blue margarita").subscribe({
      next: res => {
        console.log(res)
        this.coctelArr = res;
      },
      error: err =>{
        console.log("Se podrujo un error" + err)
      }
    })
    
  }

}
