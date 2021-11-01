import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './modules/app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MoviesPopularListComponentComponent } from './component/movies-popular-list-component/movies-popular-list-component.component';
import { MoviesItemComponentComponent } from './component/movies-item-component/movies-item-component.component';
import { HttpClientModule } from '@angular/common/http';
import { MaterialImportsModule } from './modules/material-imports.module';
import { PopularPeopleComponent } from './component/popular-people/popular-people.component';
import { PeopleItemComponent } from './component/people-item/people-item.component';
import { MovieDetailComponent } from './dialogs/movie-detail/movie-detail.component';
import { PeopleDetailsComponent } from './component/people-details/people-details.component';

@NgModule({
  declarations: [
    AppComponent,
    MoviesPopularListComponentComponent,
    MoviesItemComponentComponent,
    PopularPeopleComponent,
    PeopleItemComponent,
    MovieDetailComponent,
    PeopleDetailsComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    MaterialImportsModule
  ],

  entryComponents:[
    MovieDetailComponent
  ],



  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
