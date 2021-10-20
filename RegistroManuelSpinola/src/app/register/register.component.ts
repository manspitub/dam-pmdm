import { Component, OnInit } from '@angular/core';
import { AuthSignUpDto } from '../models/dto/auth.dto';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  signUpDto = new AuthSignUpDto();

  constructor(private authService: AuthService) { }

  ngOnInit(): void {
  }

  doSignUp() {
    this.authService.register(this.signUpDto).subscribe(signUpResult => {
      alert(`You just have registered and here is your token ${signUpResult.token}`)
    });
  }

}
