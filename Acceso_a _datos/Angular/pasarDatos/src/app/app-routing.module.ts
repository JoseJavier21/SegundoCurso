import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PadreComponent } from './components/padre/padre.component';
import { UsuarioComponent } from './components/usuario/usuario.component';

const routes: Routes = [
  {path: 'father', component: PadreComponent},
  {path: 'usuarios', component: UsuarioComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
