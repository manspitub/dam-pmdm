import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MovieResponse } from 'src/app/interface/movie-details.interface';
import { Movie } from 'src/app/interface/movie-list.interface';
import { AuthService } from 'src/app/services/auth.service';
import { MoviesServiceService } from 'src/app/services/movies-service.service';
import { environment } from 'src/environments/environment';
import { DialogAddMovieToPlaylistComponent } from '../dialogs/dialog-add-movie-to-playlist/dialog-add-movie-to-playlist.component';
import { DialogCreateListComponent } from '../dialogs/dialog-create-list/dialog-create-list.component';
import { LoginDialogComponent } from '../dialogs/login-dialog/login-dialog.component';



@Component({
  selector: 'app-movies-item-component',
  templateUrl: './movies-item-component.component.html',
  styleUrls: ['./movies-item-component.component.css']
})
export class MoviesItemComponentComponent implements OnInit {

  @Input() movie: MovieResponse | undefined;
  @Input() movieInput!: Movie;
  i:number = 0;



  constructor(private dialog: MatDialog, private movieService:MoviesServiceService, private authService: AuthService) { }

  ngOnInit(): void {
  }

  getMovieImageUrl(movieInput: Movie) {
    return `${environment.imageBaseUrl}${movieInput.poster_path}`;
  }

  /*openMovieDetailDialog(){
    this.dialog.open(MovieDetailComponent, {
      height: '700px',
      width:'500px',
      data: {id: this.movieInput?.id}
    })
  }*/

    addFavorite() {
      if(this.authService.isLoggedIn()) {
        //TODO añadir el movieInput a favoritos
      } else {
        this.openLoginDialog();
      }
    }

    addList(){
      if(this.authService.isLoggedIn()) {
        this.openCreateListDialog();
      } else {
        this.openLoginDialog();
      }
    }

    addToPlayList() {
      if(this.authService.isLoggedIn()) {
        this.openPlaylistAddDialog();
      } else {
        this.openLoginDialog();
      }
    }



    openLoginDialog() {
      this.dialog.open(LoginDialogComponent, {
        width: '400px',
        disableClose: true
      });
    }

    openPlaylistAddDialog() {
      this.dialog.open(DialogAddMovieToPlaylistComponent, {
        width: '400px',
        disableClose: true,
        data: { id: this.movie?.id }
      })
      }
    openCreateListDialog(){
      this.dialog.open(DialogCreateListComponent,{
        width: '400px',
        disableClose: false
      }
        )
    }
    }
















