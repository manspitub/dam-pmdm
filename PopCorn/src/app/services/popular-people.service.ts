import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { PopularPeopleResponse } from '../interface/popular-people';

const API_BASE_URL = 'https://api.themoviedb.org/3';
const api_key = '6f3f957d9d8dc6a98fed68a333b8209c'


@Injectable({
  providedIn: 'root'
})
export class PopularPeopleService {

  constructor(private http: HttpClient) { }

  getPopularPeopleList(): Observable<PopularPeopleResponse>{
    return this.http.get<PopularPeopleResponse>(`${API_BASE_URL}/person/popular?api_key=${api_key}`)
  }
}
