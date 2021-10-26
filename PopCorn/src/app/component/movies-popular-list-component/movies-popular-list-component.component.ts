import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Movie } from 'src/app/interface/movie-list.interface';
import { MoviesServiceService } from 'src/app/services/movies-service.service';

@Component({
  selector: 'app-movies-popular-list-component',
  templateUrl: './movies-popular-list-component.component.html',
  styleUrls: ['./movies-popular-list-component.component.css']
})
export class MoviesPopularListComponentComponent implements OnInit {
  displayedColumns: string[] = ['']
  data: any[] = [];
  datasource = new MatTableDataSource<any>(this.data);

  movieList : Movie[] = [];
  
  constructor(private movieService: MoviesServiceService) { }

  

  ngOnInit(): void {
    this.movieService.getPopularMovieList().subscribe(result => {
      this.movieList = result.results;
    });
  }

  

}
