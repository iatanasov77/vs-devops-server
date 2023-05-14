import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExamplesOtherComponent } from './examples-other.component';

describe('ExamplesOtherComponent', () => {
  let component: ExamplesOtherComponent;
  let fixture: ComponentFixture<ExamplesOtherComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExamplesOtherComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ExamplesOtherComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
