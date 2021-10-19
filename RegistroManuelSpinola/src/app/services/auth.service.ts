import { registerLocaleData } from '@angular/common';
import { HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { sign } from 'crypto';
import { Observable, observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AuthSignUpDto } from '../models/dto/auth.dto';

const AUTH_BASE_URL = 'auth';
const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
};

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  authBaseUrl = `${environment.apiBaseUrl}/${AUTH_BASE_URL}`;

  constructor() { }
}

  register(signUpDto: AuthSignUpDto): Observable<AuthSignUpResponse>{

}

  forgot() {
    let requestUrl = `${this.authBaseUrl}/forgot`
  }
}