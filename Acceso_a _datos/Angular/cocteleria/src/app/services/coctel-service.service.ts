import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CoctelServiceService {

  private BASE_URL: string = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="

  constructor(private http:HttpClient) { }

  getCoctel(coctel: string): Observable<any>{
    return this.http.get<any>(this.BASE_URL + coctel)
  }
}
