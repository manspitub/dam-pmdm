import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { MoviesItemComponentComponent } from '../component/movies-item-component/movies-item-component.component';
import { MoviesPopularListComponentComponent } from '../component/movies-popular-list-component/movies-popular-list-component.component';
import { FavouriteMovieDto } from '../dto/favoriteMovie.dto';
import { MovieResponse } from '../interface/movie-details.interface';
import { FavouriteMovie, Movie, MoviePopularResponse } from '../interface/movie-list.interface';

const API_BASE_URL = 'https://api.themoviedb.org/3';
const api_key = '6f3f957d9d8dc6a98fed68a333b8209c'

@Injectable({
  providedIn: 'root'
})
export class MoviesServiceService {

  private objectSource = new BehaviorSubject<{}>({});

  $getObjectSource = this.objectSource.asObservable

  constructor(private http: HttpClient) { }

  getPopularMovieList(): Observable<MoviePopularResponse>{
    return this.http.get<MoviePopularResponse>(`${API_BASE_URL}/movie/popular?api_key=${api_key}`);
  }

  getMovie(id: number ): Observable<MovieResponse>{
    return this.http.get<MovieResponse>(`${API_BASE_URL}/movie/${id}?api_key=${api_key}`);
  }

  favouriteMovie(favoriteMovieDto: FavouriteMovieDto): Observable<FavouriteMovie>{
    return this.http.post<FavouriteMovie>(`https://api.themoviedb.org/3/account/null/favorite?api_key=${environment.apiKey}&session_id=${localStorage.getItem('session_id')}`, favoriteMovieDto);
  }

  sendObjectSource(data:any){
    this.objectSource.next(data);
  }

}
