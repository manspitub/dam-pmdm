export class AuthSignUpDto {
    username: string 
    email: string;
    password: string;
    code: string

    constructor() {
        this.email = '';
        this.password = '';
        this.username = '';
        this.code = '';
    }
}