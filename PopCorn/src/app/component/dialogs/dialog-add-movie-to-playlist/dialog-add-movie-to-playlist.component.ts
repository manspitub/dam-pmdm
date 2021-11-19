import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-dialog-add-movie-to-playlist',
  templateUrl: './dialog-add-movie-to-playlist.component.html',
  styleUrls: ['./dialog-add-movie-to-playlist.component.css']
})
export class DialogAddMovieToPlaylistComponent implements OnInit {

  constructor(private authService: AuthService,
    private router: Router) { }

  ngOnInit(): void {
  }

  addList(){
    this.authService.
  }

}
