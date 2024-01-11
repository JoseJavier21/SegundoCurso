import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SaveComponent } from './components/save/save.component';
import { HomeComponent } from './components/home/home.component';
import { ContactListComponent } from './components/contact-list/contact-list.component';
import { ErrorComponent } from './components/error/error.component';
import { UpdateComponent } from './components/update/update.component';

const routes: Routes = [
  {path:'save', component: SaveComponent, title: 'save'},
  {path: 'contact-list', component: ContactListComponent, title: 'contactoLista'},
  {path: 'error', component: ErrorComponent, title: 'error'},
  {path: 'update', component: UpdateComponent, title: 'update'},
  //{path: 'home', component: ErrorComponent, title: 'home'},
  {path: '**', pathMatch: 'full', redirectTo: ''},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
