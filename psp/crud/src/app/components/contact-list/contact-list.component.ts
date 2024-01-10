import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ContactService } from 'src/app/services/contact.service';

@Component({
  selector: 'app-contact-list',
  templateUrl: './contact-list.component.html',
  styleUrls: ['./contact-list.component.css']
})
export class ContactListComponent {

  data:any[] = []

  constructor(private contactService: ContactService, private router: Router){

  }

  ngOnInit(): void {
    this.getContacts()    
  }

  getContacts(): void{
    this.contactService.contactList().subscribe({
      next : res => {
        //console.log(res)
        this.data = res.success
      }
    })
  }

  deleteContact(id:number): void{
    this.contactService.deleteContact(id).subscribe({
      next: res =>{
        console.log(res)
        this.getContacts()
      },
      error : error =>{
        console.log(error)
      }
    })
  }

  updateContact(id:string){
    sessionStorage.setItem('id', id)
    this.router.navigate(['/update'])
  }

}
