import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FormGuardadoComponent } from './form-guardado.component';

describe('FormGuardadoComponent', () => {
  let component: FormGuardadoComponent;
  let fixture: ComponentFixture<FormGuardadoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [FormGuardadoComponent]
    });
    fixture = TestBed.createComponent(FormGuardadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
