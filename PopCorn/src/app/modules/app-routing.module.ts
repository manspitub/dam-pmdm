import { Component, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MoviesPopularListComponentComponent } from '../component/movies-popular-list-component/movies-popular-list-component.component';
import { PeopleDetailsComponent } from '../component/people-details/people-details.component';
import { PopularPeopleComponent } from '../component/popular-people/popular-people.component';

const routes: Routes = [
  {path:'movies-popular', component: MoviesPopularListComponentComponent},
  {path:'people-popular', component: PopularPeopleComponent},
  {path:'people-details', component: PeopleDetailsComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
