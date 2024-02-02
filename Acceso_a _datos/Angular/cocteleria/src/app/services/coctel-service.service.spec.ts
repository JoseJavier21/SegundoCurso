import { TestBed } from '@angular/core/testing';

import { CoctelServiceService } from './coctel-service.service';

describe('CoctelServiceService', () => {
  let service: CoctelServiceService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CoctelServiceService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
