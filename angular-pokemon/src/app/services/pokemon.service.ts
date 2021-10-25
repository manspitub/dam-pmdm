import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { PokemonListResponse } from '../interfaces/pokemon-list.interface';

const API_BASE_URL = 'https://pokeapi.co/api/v2';

@Injectable({
  providedIn: 'root'
})
export class PokemonService {

  constructor(private http: HttpClient) { }

  baseUrl = environment.baseUrl;

  getPokemonList(limit: number): Observable<PokemonListResponse> {
    return this.http.get<PokemonListResponse>(`${API_BASE_URL}/pokemon?limit=${limit}`);
  }

  getPokemons(id) {
    return this.http.get<any>(`${this.baseUrl}/pokemon/${index}`)
  }
  getPokemonPhotoUrl(url: string): string {
    let splitArray = url.split("/");
    console.log(splitArray);
    return `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${splitArray[6]}.png`;
  }

}
