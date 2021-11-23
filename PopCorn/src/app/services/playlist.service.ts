import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AddMovieToListDto } from '../dto/addMovieToList.dto';
import { CreatedListDto } from '../dto/createdList.dto';
import { ListIdDto } from '../dto/listId.dto';
import { AddToListResponse, CreateListResponse, ListsResponse, PlaylistResponse } from '../interface/list.interface';


const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
};


@Injectable({
  providedIn: 'root'
})
export class PlaylistService {

  constructor(private http: HttpClient) { }

  listPost(listPost: CreatedListDto): Observable<CreateListResponse> {
    return this.http.post<CreateListResponse>(`https://api.themoviedb.org/3/list?api_key=${environment.apiKey}&session_id=${localStorage.getItem('session_id')}`, listPost, DEFAULT_HEADERS);
  }

  addToList(addMovie: AddMovieToListDto,  listId: ListIdDto): Observable<AddToListResponse>{
    return this.http.post<AddToListResponse>(`https://api.themoviedb.org/3/list/${listId}/add_item?api_key=${environment.apiKey}&session_id=${localStorage.getItem('session_id')}`, addMovie)
  }

  getPlaylistDetails(listId: number): Observable<PlaylistResponse>{
    return this.http.get<PlaylistResponse>(`https://api.themoviedb.org/3/list/${listId}?api_key=${environment.apiKey}&language=${environment.lang}}`)
  }

  getListsCreated(): Observable<ListsResponse>{
    return this.http.get<ListsResponse>(`https://api.themoviedb.org/3/account/11320876/lists?api_key=${environment.apiKey}&language=${environment.lang}S&session_id=${localStorage.getItem('session_id')}`)
  }




}
