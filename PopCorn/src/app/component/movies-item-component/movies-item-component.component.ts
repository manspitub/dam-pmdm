import { Component, Input, OnInit } from '@angular/core';
import { Movie } from 'src/app/interface/movie-list.interface';


@Component({
  selector: 'app-movies-item-component',
  templateUrl: './movies-item-component.component.html',
  styleUrls: ['./movies-item-component.component.css']
})
export class MoviesItemComponentComponent implements OnInit {
  
  @Input() movie!: Movie;
  i:number = 0;
  constructor() { }

  ngOnInit(): void {
  }

}
