import { Component, Inject, Input, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { AddMovieToListDto } from 'src/app/dto/addMovieToList.dto';
import { ListIdDto } from 'src/app/dto/listId.dto';
import { CreateListResponse, CreateListResponses, ListForm, PlaylistResponse, Item, ListsResponse, List } from 'src/app/interface/list.interface';
import { MovieResponse } from 'src/app/interface/movie-details.interface';
import { MoviesServiceService } from 'src/app/services/movies-service.service';
import { PlaylistService } from 'src/app/services/playlist.service';

export interface DialogMovieListData{
  id: number;
}

@Component({
  selector: 'app-dialog-add-movie-to-playlist',
  templateUrl: './dialog-add-movie-to-playlist.component.html',
  styleUrls: ['./dialog-add-movie-to-playlist.component.css']
})
export class DialogAddMovieToPlaylistComponent implements OnInit {

  addMovieToList= new AddMovieToListDto();
  listId= new ListIdDto;
  listas: ListsResponse[] = [];
  lista: List[] = [];
  list!: List;
  movieInput!: MovieResponse;



  idList !: CreateListResponse;

  constructor(private listService: PlaylistService,
    @Inject(MAT_DIALOG_DATA) private data: DialogMovieListData, private movieService: MoviesServiceService) { }

  ngOnInit(): void {
    this.listService.getListsCreated().subscribe(result =>{
      this.lista = result.results;
    });
    console.log(this.data.id);
    this.movieService.getMovie(this.data.id).subscribe(result=> {
      this.movieInput= result;
      this.addMovieToList.media_id = result.id

    });
  }

  addMovie() {
    this.listService.addToList(this.addMovieToList, this.listId).subscribe();
    console.log(this.data.id);
  }



  getMovieId(): void {
     this.addMovieToList.media_id = this.data.id
  }

  getLists(){

  }

  getMovieId1() {
    this.movieService.getMovie(this.data.id).subscribe(result=> {
      this.movieInput = result
      return result.id
    })
  }







}
