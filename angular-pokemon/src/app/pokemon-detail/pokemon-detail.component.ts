import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PokemonItemComponent } from '../pokemon-item/pokemon-item.component';
import { PokemonService } from '../services/pokemon.service';
 

@Component({
  selector: 'app-pokemon-detail',
  templateUrl: './pokemon-detail.component.html',
  styleUrls: ['./pokemon-detail.component.css']
})
export class PokemonDetailComponent implements OnInit {

  pokemon: any = '';
  pokemonType = [];
  pokemonImg = '';

  constructor(private pokemonService: PokemonService, private activatedRouter: ActivatedRoute) {
    this.activatedRouter.params.subscribe(
      params => {
        this.getPokemon(params['id'])
      }
    )
   }
  
  ngOnInit(): void {
  }

  getPokemon(id: any) {
    this.pokemonService.getPokemons(id).subscribe(
      res => {
        
      }
    )
  }

}
