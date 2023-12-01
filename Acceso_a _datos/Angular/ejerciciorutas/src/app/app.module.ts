import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { Ejercicio1Component } from './components/ejercicio1/ejercicio1.component';
import { FormsModule } from '@angular/forms';
import { Ejercicio2Component } from './components/ejercicio2/ejercicio2.component';
import { Ejercicio3Component } from './components/ejercicio3/ejercicio3.component';

@NgModule({
  declarations: [
    AppComponent,
    Ejercicio1Component,
    Ejercicio2Component,
    Ejercicio3Component
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
