import { Component, OnInit } from '@angular/core';
import { MoviesPopular } from 'src/app/interface/movie-list.interface';
import { MoviesServiceService } from 'src/app/services/movies-service.service';

@Component({
  selector: 'app-movies-popular-list-component',
  templateUrl: './movies-popular-list-component.component.html',
  styleUrls: ['./movies-popular-list-component.component.css']
})
export class MoviesPopularListComponentComponent implements OnInit {

  constructor(private movieService: MoviesServiceService) { }

  movieList: MoviesPopular[] | undefined

  ngOnInit(): void {
  }

  getMoviesPopular(){
    this.movieService.getPopularMovieList().subscribe( resultado => {
      this.movieList = resultado.results;
      console.log(resultado);
    })
  }

}
