import { Component, OnInit } from '@angular/core';
import { Form, FormBuilder, FormGroup } from '@angular/forms';
import { Route, Router } from '@angular/router';
import { ContactService } from 'src/app/services/contact.service';

@Component({
  selector: 'app-update',
  templateUrl: './update.component.html',
  styleUrls: ['./update.component.css']
})
export class UpdateComponent {

  form: FormGroup

  ngOnInit(): void {

    this.findContact()
    
  }

  constructor(private formBuilder: FormBuilder, private contactoService: ContactService, private router: Router){
    this.form = formBuilder.group({
      nombre : [''],
      apellido: [''],
      telefono : [''],
      id : [''],
    })
  }

  findContact(){
    let id = sessionStorage.getItem('id')

    console.log(id);

    if(id != null){

      this.contactoService.showContactoById(id).subscribe({
        next : res =>{
          console.log(res);
          this.form.patchValue({
            nombre : res.success.nombre,
            apellido : res.success.apelldio,
            telefono : res.success.telefono,
            id : res.succes.id,
          })
        },
        error: error =>{
          console.log(error);
        }
      });
    }

  }

  update(){
    console.log('updating ...')
    console.log(this.form.value)

    this.contactoService.updateContact(this.form.value, Number(sessionStorage.getItem("id"))).subscribe({
      next: res => {
        console.log(res)
        this.router.navigate(['/contact-list'])
      },
      error : err => {
        console.log(err)
        this.router.navigate(['/error'])
      }
    }
    )
    
  }
}
