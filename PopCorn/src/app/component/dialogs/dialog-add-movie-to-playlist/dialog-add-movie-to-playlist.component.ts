import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { AddMovieToListDto } from 'src/app/dto/addMovieToList.dto';
import { CreateListResponse, CreateListResponses, ListForm } from 'src/app/interface/list.interface';
import { Movie } from 'src/app/interface/movie-list.interface';
import { AuthService } from 'src/app/services/auth.service';
import { PlaylistService } from 'src/app/services/playlist.service';

export interface DialogMovieListData{
  id: number
}

@Component({
  selector: 'app-dialog-add-movie-to-playlist',
  templateUrl: './dialog-add-movie-to-playlist.component.html',
  styleUrls: ['./dialog-add-movie-to-playlist.component.css']
})
export class DialogAddMovieToPlaylistComponent implements OnInit {

  addMovieToList= new AddMovieToListDto;
  listas : CreateListResponse[] = [];
  movies !: Movie[];

  idList !: CreateListResponse

  constructor(private listService: PlaylistService,
    @Inject(MAT_DIALOG_DATA) private data: DialogMovieListData) { }

  ngOnInit(): void {

  }

  addMovie() {
    this.listService.addToList(this.addMovieToList, 7114463).subscribe()
  }

  getLists(): void {
    this.listService.getPlaylistDetails
  }







}
