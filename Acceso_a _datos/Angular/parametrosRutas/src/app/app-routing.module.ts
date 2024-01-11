import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ParametroComponent } from './components/parametro/parametro.component';

const routes: Routes = [
  {path: '', component: ParametroComponent},
  {path: ':id/:nombre', component: ParametroComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
