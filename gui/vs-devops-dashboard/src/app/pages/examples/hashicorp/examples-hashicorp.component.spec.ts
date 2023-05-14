import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExamplesHashicorpComponent } from './examples-hashicorp.component';

describe('ExamplesHashicorpComponent', () => {
  let component: ExamplesHashicorpComponent;
  let fixture: ComponentFixture<ExamplesHashicorpComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExamplesHashicorpComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ExamplesHashicorpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
