import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExamplesHashicorpTerraformComponent } from './examples-hashicorp-terraform.component';

describe('ExamplesHashicorpTerraformComponent', () => {
  let component: ExamplesHashicorpTerraformComponent;
  let fixture: ComponentFixture<ExamplesHashicorpTerraformComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExamplesHashicorpTerraformComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ExamplesHashicorpTerraformComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
