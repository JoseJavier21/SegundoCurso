import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { Ejercicio1Component } from './components/ejercicio1/ejercicio1.component';

@NgModule({
  declarations: [
    AppComponent,
    Ejercicio1Component
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
