import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
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

  constructor(private movieService: MoviesServiceService, @Inject(MAT_DIALOG_DATA) private data: ) { }

  ngOnInit(): void {
    this.movieService.favouriteMovie().subscribe()  }
  }




