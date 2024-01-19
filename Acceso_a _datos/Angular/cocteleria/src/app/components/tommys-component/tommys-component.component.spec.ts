import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TommysComponentComponent } from './tommys-component.component';

describe('TommysComponentComponent', () => {
  let component: TommysComponentComponent;
  let fixture: ComponentFixture<TommysComponentComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [TommysComponentComponent]
    });
    fixture = TestBed.createComponent(TommysComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
