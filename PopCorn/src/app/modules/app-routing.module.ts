import { Component, NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { MoviesPopularListComponentComponent } from '../component/movies-popular-list-component/movies-popular-list-component.component';
import { PeopleDetailsComponent } from '../component/people-details/people-details.component';
import { PopularPeopleComponent } from '../component/popular-people/popular-people.component';
import { SessionComponent } from '../component/session/session.component';

const routes: Routes = [
  {path:'movies-popular', component: MoviesPopularListComponentComponent},
  {path:'people-popular', component: PopularPeopleComponent},
  {path:'people-details', component: PeopleDetailsComponent },
  {path: 'loginsuccess', component: SessionComponent},
  {path: '', pathMatch: 'full', component: MoviesPopularListComponentComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
