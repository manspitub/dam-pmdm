import { Component, EventEmitter, Inject, OnInit, Output } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { MoviesItemComponentComponent } from 'src/app/component/movies-item-component/movies-item-component.component';
import { MovieResponse } from 'src/app/interface/movie-details.interface';
import { Movie, MoviesPopularResponse } from 'src/app/interface/movie-list.interface';
import { MoviesServiceService } from 'src/app/services/movies-service.service';
import { environment } from 'src/environments/environment';

export interface DialogMovieDetailData{
      id: number
}

@Component({
  selector: 'app-movie-detail',
  templateUrl: './movie-detail.component.html',
  styleUrls: ['./movie-detail.component.css']
})
export class MovieDetailComponent implements OnInit {

  movie!: MovieResponse
  movieInput!: Movie
  movieOutput: MoviesItemComponentComponent | undefined


  constructor(@Inject(MAT_DIALOG_DATA) private data: DialogMovieDetailData,
  private movieService: MoviesServiceService, private router:Router) { }

  ngOnInit(): void {

  }

  getMovieImageUrl(movie: MovieResponse) {
    return `${environment.imageBaseUrl}${movie.poster_path}`;
  }




  }




