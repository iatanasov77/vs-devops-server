import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExamplesAnsibleGeneralComponent } from './examples-ansible-general.component';

describe('ExamplesAnsibleGeneralComponent', () => {
  let component: ExamplesAnsibleGeneralComponent;
  let fixture: ComponentFixture<ExamplesAnsibleGeneralComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExamplesAnsibleGeneralComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ExamplesAnsibleGeneralComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
