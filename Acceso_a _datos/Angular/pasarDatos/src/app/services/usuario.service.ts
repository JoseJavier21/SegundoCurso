import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  constructor(private http:HttpClient) { }

  URL:string = 'https://alejandroestech.com/examen';

  getUser(): Observable<any>{
    return this.http.get<any>(this.URL + '/' + 'ejercicio-uno')
  }

}
