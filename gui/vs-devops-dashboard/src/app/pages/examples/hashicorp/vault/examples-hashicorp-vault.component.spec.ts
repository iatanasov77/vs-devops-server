import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExamplesHashicorpVaultComponent } from './examples-hashicorp-vault.component';

describe('ExamplesHashicorpVaultComponent', () => {
  let component: ExamplesHashicorpVaultComponent;
  let fixture: ComponentFixture<ExamplesHashicorpVaultComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExamplesHashicorpVaultComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ExamplesHashicorpVaultComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
