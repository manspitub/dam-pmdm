import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { MoviesPopularListComponentComponent } from '../component/movies-popular-list-component/movies-popular-list-component.component';
import { MovieResponse } from '../interface/movie-details.interface';
import { Movie, MoviesPopularResponse } from '../interface/movie-list.interface';

const API_BASE_URL = 'https://api.themoviedb.org/3';
const api_key = '6f3f957d9d8dc6a98fed68a333b8209c'

@Injectable({
  providedIn: 'root'
})
export class MoviesServiceService {

  constructor(private http: HttpClient) { }

  getPopularMovieList(): Observable<MoviesPopularResponse>{
    return this.http.get<MoviesPopularResponse>(`${API_BASE_URL}/movie/popular?api_key=${api_key}`)
  }

  getMovie(id: number ): Observable<MovieResponse>{
    return this.http.get<MovieResponse>(`${API_BASE_URL}/movie/${id}?api_key=${api_key}`)
  }
}
