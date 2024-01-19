import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BlueComponentComponent } from './components/blue-component/blue-component.component';
import { TommysComponentComponent } from './components/tommys-component/tommys-component.component';

const routes: Routes = [
  {path: "blue-coctel", component: BlueComponentComponent},
  {path: "tommy-coctel" , component: TommysComponentComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
