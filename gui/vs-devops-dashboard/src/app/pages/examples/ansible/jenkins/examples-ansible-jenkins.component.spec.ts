import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExamplesAnsibleJenkinsComponent } from './examples-ansible-jenkins.component';

describe('ExamplesAnsibleJenkinsComponent', () => {
  let component: ExamplesAnsibleJenkinsComponent;
  let fixture: ComponentFixture<ExamplesAnsibleJenkinsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExamplesAnsibleJenkinsComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ExamplesAnsibleJenkinsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
