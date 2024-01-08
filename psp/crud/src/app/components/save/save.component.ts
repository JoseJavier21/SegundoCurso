import { Component } from '@angular/core';
import { ContactService } from 'src/app/services/contact.service';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { TmplAstDeferredBlockLoading } from '@angular/compiler';

@Component({
  selector: 'app-save',
  templateUrl: './save.component.html',
  styleUrls: ['./save.component.css']
})
export class SaveComponent {

  form:FormGroup

  constructor(private contactService: ContactService, private formBuilder: FormBuilder, private router: Router){

    this.form = this.formBuilder.group({
      nombre: [''],
      apellido: [''],
      telefono: ['']
    })
  }

  getForm(){
    //console.log(this.form.value)

    this.contactService.addContact(this.form.value).subscribe({
      next : res => {
        console.log(res)
        this.router.navigate(['/contact-list'])
      },
      error : error => {
        this.router.navigate(['/error'])
      }
    })

  }






  
}
