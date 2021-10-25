import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { PokemonDetailComponent } from '../pokemon-detail/pokemon-detail.component';


const routes: Routes = [
  { path: 'home', component: PokemonDetailComponent },
  { path: 'pokeDetail/:id', component: PokemonDetailComponent },
  { path: '', pathMatch: 'full', redirectTo: 'home'},
  { path: '**', pathMatch: 'full', redirectTo: 'home'},

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
