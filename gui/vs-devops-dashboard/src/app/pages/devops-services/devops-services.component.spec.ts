import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DevopsServicesComponent } from './devops-services.component';

describe('DevopsServicesComponent', () => {
  let component: DevopsServicesComponent;
  let fixture: ComponentFixture<DevopsServicesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DevopsServicesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DevopsServicesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
