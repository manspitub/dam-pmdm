import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MovieDetailComponent } from 'src/app/dialogs/movie-detail/movie-detail.component';
import { MovieResponse } from 'src/app/interface/movie-details.interface';
import { Movie } from 'src/app/interface/movie-list.interface';
import { MoviesServiceService } from 'src/app/services/movies-service.service';
import { environment } from 'src/environments/environment';



@Component({
  selector: 'app-movies-item-component',
  templateUrl: './movies-item-component.component.html',
  styleUrls: ['./movies-item-component.component.css']
})
export class MoviesItemComponentComponent implements OnInit {

  @Input() movie: MovieResponse | undefined;
  @Input() movieInput!: Movie;
  i:number = 0;



  constructor(private dialog: MatDialog, private movieService:MoviesServiceService) { }

  ngOnInit(): void {
  }

  getMovieImageUrl(movieInput: Movie) {
    return `${environment.imageBaseUrl}${movieInput.poster_path}`;
  }

  openMovieDetailDialog(){
    this.dialog.open(MovieDetailComponent, {
      height: '700px',
      width:'500px',
      data: {id: this.movieInput?.id}
    })

    








  }



}


