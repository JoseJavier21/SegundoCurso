import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Contact } from '../clases/Contact';

@Injectable({
  providedIn: 'root'
})
export class ContactService {

  private BASE_URL: string = "http://localhost:8080/api/contacto"
  private httpHeaders: HttpHeaders = new HttpHeaders({'Content-Type' : 'application/json'})

  constructor(private http:HttpClient){}

  addContact(contact: Contact): Observable<Contact>{
    return this.http.post<Contact>(this.BASE_URL, contact, {headers: this.httpHeaders})
  }

  contactList(): Observable<any>{
    return this.http.get(this.BASE_URL)
  }

  deleteContact(id: number): Observable<any>{
    return this.http.delete(this.BASE_URL + '/' + id)
  }

  showContactoById(id: string): Observable<any>{
    return this.http.get<Contact>(this.BASE_URL + '/by-id/' + id)
  }

  updateContact(id: number, contact: Number): Observable<any>{
    return this.http.put<any>(this.BASE_URL + 'id' + id ,contact, {headers: this.httpHeaders})
  }
}


