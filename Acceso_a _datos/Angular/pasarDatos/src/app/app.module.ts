import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PadreComponent } from './components/padre/padre.component';
import { HijoComponent } from './components/hijo/hijo.component';
import { HttpClientModule } from '@angular/common/http';
import { Observable } from 'rxjs';
import { UsuarioComponent } from './components/usuario/usuario.component';


@NgModule({
  declarations: [
    AppComponent,
    PadreComponent,
    HijoComponent,
    UsuarioComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
