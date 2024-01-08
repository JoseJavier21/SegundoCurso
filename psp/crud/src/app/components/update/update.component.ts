import { Component, OnInit } from '@angular/core';
import { Form, FormBuilder, FormGroup } from '@angular/forms';
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

  constructor(private formBuilder: FormBuilder, private contactoService: ContactService){
    this.form = formBuilder.group({
      nombre : [''],
      apellido: [''],
      telefono : [''],
      if : [''],
    })
  }

  findContact(){
    let id = sessionStorage.getItem('id')

    console.log(id);

    if(id != null){

      this.contactoService.showContactoById(id).subscribe({
        next : res =>{
          console.log(res);
        },
        error: error =>{
          console.log(error);
        }
      });
    }



  }


}
