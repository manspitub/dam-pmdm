import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Movie } from 'src/app/interface/movie-list.interface';
import { AuthService } from 'src/app/services/auth.service';
import { MoviesServiceService } from 'src/app/services/movies-service.service';

@Component({
  selector: 'app-movies-popular-list-component',
  templateUrl: './movies-popular-list-component.component.html',
  styleUrls: ['./movies-popular-list-component.component.css']
})
export class MoviesPopularListComponentComponent implements OnInit {

  movieList : Movie[] = [];

  constructor(private movieService: MoviesServiceService, private authService: AuthService) { }



  ngOnInit(): void {
    console.log(this.authService.getSessionId())
    this.movieService.getPopularMovieList().subscribe(result => {
      this.movieList = result.results;
    });
  }



}
