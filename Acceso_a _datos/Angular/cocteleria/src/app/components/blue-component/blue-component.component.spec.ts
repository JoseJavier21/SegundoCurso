import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BlueComponentComponent } from './blue-component.component';

describe('BlueComponentComponent', () => {
  let component: BlueComponentComponent;
  let fixture: ComponentFixture<BlueComponentComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [BlueComponentComponent]
    });
    fixture = TestBed.createComponent(BlueComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
