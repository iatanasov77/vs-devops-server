import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExamplesAnsibleNagiosComponent } from './examples-ansible-nagios.component';

describe('ExamplesAnsibleNagiosComponent', () => {
  let component: ExamplesAnsibleNagiosComponent;
  let fixture: ComponentFixture<ExamplesAnsibleNagiosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExamplesAnsibleNagiosComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ExamplesAnsibleNagiosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
