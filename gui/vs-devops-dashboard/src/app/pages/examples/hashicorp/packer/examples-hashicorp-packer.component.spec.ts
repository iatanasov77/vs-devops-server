import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExamplesHashicorpPackerComponent } from './examples-hashicorp-packer.component';

describe('ExamplesHashicorpPackerComponent', () => {
  let component: ExamplesHashicorpPackerComponent;
  let fixture: ComponentFixture<ExamplesHashicorpPackerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExamplesHashicorpPackerComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ExamplesHashicorpPackerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
