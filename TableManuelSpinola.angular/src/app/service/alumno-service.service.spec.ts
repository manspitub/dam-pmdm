import { TestBed } from '@angular/core/testing';

import { StudetAlumnoServiceService } from './alumno-service.service';

describe('StudetAlumnoServiceService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: StudetAlumnoServiceService = TestBed.get(StudetAlumnoServiceService);
    expect(service).toBeTruthy();
  });
});
