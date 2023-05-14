import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExamplesAnsibleComponent } from './examples-ansible.component';

describe('ExamplesAnsibleComponent', () => {
  let component: ExamplesAnsibleComponent;
  let fixture: ComponentFixture<ExamplesAnsibleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExamplesAnsibleComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ExamplesAnsibleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
