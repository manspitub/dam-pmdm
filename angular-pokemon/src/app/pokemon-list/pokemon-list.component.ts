import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { Pokemon, PokemonListResponse } from '../interfaces/pokemon-list.interface';
import { PokemonService } from '../services/pokemon.service';


@Component({
  selector: 'app-pokemon-list',
  templateUrl: './pokemon-list.component.html',
  styleUrls: ['./pokemon-list.component.css']
})
export class PokemonListComponent implements OnInit {
  
  displayedColumns: string[] = ['position', 'image', 'name'];
  data: any[] = [];
  datasource = new MatTableDataSource<any>(this.data);
  pokemons = [];

  

  constructor(private pokemonService: PokemonService, private router: Router) {}

  ngOnInit(): void {
    this.getPokemons();
  }

  getPokemons() {

    let pokemonData;

   for(let i =1; i<= 200; i++{
     this.pokemonService.getPokemon().subscribe(
      res => {
        pokemonData = {
          position = i,
          image: res.sprites.front_default,
          name: res.name
        };
        this.data.push(pokemonData)
        this.datasource = new MatTableDataSource<any>(this.data)
        console.log(res);
      },
      err=>{
        console.log(err)
      }
    )
   } 
    
  }

  getRow(row){
    this.router.navigateByUrl(`pokeDetail/${row.position}`);
  }

  

}
