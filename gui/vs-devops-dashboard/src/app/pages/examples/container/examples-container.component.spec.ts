import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExamplesContainerComponent } from './examples-container.component';

describe('ExamplesContainerComponent', () => {
  let component: ExamplesContainerComponent;
  let fixture: ComponentFixture<ExamplesContainerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExamplesContainerComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ExamplesContainerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
