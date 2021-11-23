import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { FavouriteMovieDto } from 'src/app/dto/favoriteMovie.dto';
import { MovieResponse } from 'src/app/interface/movie-details.interface';
import { MoviesServiceService } from 'src/app/services/movies-service.service';

export interface DialogMovieData{
  id: number
}


@Component({
  selector: 'app-dialog-favourite-movie',
  templateUrl: './dialog-favourite-movie.component.html',
  styleUrls: ['./dialog-favourite-movie.component.css']
})
export class DialogFavouriteMovieComponent implements OnInit {
  favouriteMovie= new FavouriteMovieDto();
  movieInput!: MovieResponse;

  constructor(private movieService: MoviesServiceService, @Inject(MAT_DIALOG_DATA) private data: DialogMovieData) { }

  ngOnInit(): void {
    console.log(this.data.id)
    this.movieService.getMovie(this.data.id).subscribe(result=> {
      this.movieInput=result;
      this.favouriteMovie.media_id = this.data.id
      this.markAsFavourite()
    });

    }

    markAsFavourite() {
      this.movieService.favouriteMovie(this.favouriteMovie).subscribe();
    }


  }




