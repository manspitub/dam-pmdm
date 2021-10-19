import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {

  siginUpDto = new AuthSignUpDto();


  constructor(private authService: AuthService) { }

  ngOnInit(): void {
  }

  doLogin() {
    this.authService.signUp(this.siginUpDto).suscribe(signUpResult => {
      alert(`Te has registrado y tu token es ${signUpResult.token}`)
    });
  }


}
