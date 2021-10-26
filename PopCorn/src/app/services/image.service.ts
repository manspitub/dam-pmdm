import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ImageResponse } from '../interface/image.interface';

const API_BASE_URL = 'https://api.themoviedb.org/3';
const api_key = '6f3f957d9d8dc6a98fed68a333b8209c'

@Injectable({
  providedIn: 'root'
})
export class ImageService {

  constructor(private http: HttpClient) { }

  getImagesList(popularPeople: number): Observable<ImageResponse>{
    return this.http.get<ImageResponse>(`${API_BASE_URL}/person{person_id}/images?api_key=${api_key}`)
  }

}
