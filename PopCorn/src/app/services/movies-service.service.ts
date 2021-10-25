import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { MoviesPopularListComponentComponent } from '../component/movies-popular-list-component/movies-popular-list-component.component';
import { MoviesPopularListResponse } from '../interface/movie-list.interface';

const API_BASE_URL = 'https://api.themoviedb.org/3';
const api_key = '6f3f957d9d8dc6a98fed68a333b8209c'

@Injectable({
  providedIn: 'root'
})
export class MoviesServiceService {

  constructor(private http: HttpClient) { }

  getPopularMovieList(): Observable<MoviesPopularListResponse>{
    return this.http.get<MoviesPopularListResponse>(`${API_BASE_URL}/movie/popular?api_key=${api_key}`)
  }
}
