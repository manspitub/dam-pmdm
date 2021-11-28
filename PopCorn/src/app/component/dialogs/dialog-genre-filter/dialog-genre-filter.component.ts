import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { GenreIdDto } from 'src/app/dto/genre.dto';
import { Genre, GenreResponse } from 'src/app/interface/list.interface';
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
  genreId=new GenreIdDto

  constructor(private listService: PlaylistService, @Inject(MAT_DIALOG_DATA) private data: DialogGenreListData, private movieService: MoviesServiceService) { }

  ngOnInit(): void {

    this.listService.getGenreList().subscribe(result =>{
      this.genres = result.genres 
    });
    console.log(this.data.id);
    

  }

  getMoviesFromGenre(){
    
  }

}
