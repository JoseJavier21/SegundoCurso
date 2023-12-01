import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Ejercicio1Component } from './components/ejercicio1/ejercicio1.component';
import { Ejercicio2Component } from './components/ejercicio2/ejercicio2.component';
import { Ejercicio3Component } from './components/ejercicio3/ejercicio3.component';

const routes: Routes = [
  {path: 'uno', component: Ejercicio1Component},
  {path: 'dos', component: Ejercicio2Component},
  {path: 'tres', component: Ejercicio3Component},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
