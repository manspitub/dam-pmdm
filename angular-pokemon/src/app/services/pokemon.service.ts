import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { PokemonListResponse } from '../interfaces/pokemon-list.interface';



@Injectable({
  providedIn: 'root'
})
export class PokemonService {
  baseUrl = environment.baseUrl;

  constructor(private http: HttpClient) { }

  getPokemon(){
    return this.http.get<any>(`${this.baseUrl}/pokemon`)
  }

  

}
