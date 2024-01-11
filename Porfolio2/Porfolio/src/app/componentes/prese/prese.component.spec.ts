import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PreseComponent } from './prese.component';

describe('PreseComponent', () => {
  let component: PreseComponent;
  let fixture: ComponentFixture<PreseComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [PreseComponent]
    });
    fixture = TestBed.createComponent(PreseComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
