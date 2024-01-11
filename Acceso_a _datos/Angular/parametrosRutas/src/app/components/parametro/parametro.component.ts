import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-parametro',
  templateUrl: './parametro.component.html',
  styleUrls: ['./parametro.component.css']
})
export class ParametroComponent {

  constructor(private activateRoute: ActivatedRoute){
    this.getQueryParam()
  }


  getQueryParam():void{
    this.activateRoute.queryParamMap.subscribe(
      function(params){
        console.log(params.get('id'))
      }

    )

  }

  getPathVariable():void{

    this.activateRoute.params.subscribe(
      function(params){
        console.log(params['id'])
        console.log(params['nombre'])
      }
    )

  }


}
