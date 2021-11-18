import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor() { }

  getSessionId(){
    return localStorage.getItem('sessionId')
  }

  isLoggedIn(): boolean{
    return true
  }

  setSessionId(sessionId: string) {
    localStorage.setItem('session_id', sessionId);
  }

}
