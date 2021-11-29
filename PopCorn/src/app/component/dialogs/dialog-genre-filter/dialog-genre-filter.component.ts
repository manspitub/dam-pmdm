import { Component, Inject, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { GenreIdDto } from 'src/app/dto/genre.dto';
import { Genre, GenreResponse } from 'src/app/interface/list.interface';
import { Movie } from 'src/app/interface/movie-list.interface';
import { MoviesServiceService } from 'src/app/services/movies-service.service';
import { PlaylistService } from 'src/app/services/playlist.service';

export interface DialogGenreListData{
  id: number
}

@Component({
  selector: 'app-dialog-genre-filter',
  templateUrl: './dialog-genre-filter.component.html',
  styleUrls: ['./dialog-genre-filter.component.css']
})
export class DialogGenreFilterComponent implements OnInit {


  genres: Genre[] = [];
  genreSelected: Genre[] = [];
  movieFiltered: Movie[] = []
  movies: Movie[] = []
  listaMoviesFiltrada: Movie[] = []
  genreId= new GenreIdDto;
  genderFormControl = new FormControl('')

  constructor(private listService: PlaylistService, @Inject(MAT_DIALOG_DATA) private data: DialogGenreListData, private movieService: MoviesServiceService) { }

  ngOnInit(): void {
    this.genderFormControl
    this.listService.getGenreList().subscribe(result =>{
      this.genres = result.genres
    });

    this.movieService.getPopularMovieList().subscribe(result =>{
      this.movies = result.results;
      this.listaMoviesFiltrada = this.movies
    })


  }

  getMoviesFromGenre(){
    let genreSelected = this.genreId.genre_id

    this.listaMoviesFiltrada = this.movies.filter(p=> p.genre_ids.includes(genreSelected))
  }

  /*getGenreId(m: Movie){
    let movieId = m.genre_ids
    let result = movieId.map(function)
    return result;
  }*/

}
