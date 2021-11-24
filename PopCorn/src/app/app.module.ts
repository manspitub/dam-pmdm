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
import { PeopleDetailsComponent } from './component/people-details/people-details.component';
import { NgCircleProgressModule } from 'ng-circle-progress';
import { animation } from '@angular/animations';
import { FlexLayoutModule } from '@angular/flex-layout';
import { LoginDialogComponent } from './component/dialogs/login-dialog/login-dialog.component';
import { SessionComponent } from './component/session/session.component';
import { DialogAddMovieToPlaylistComponent } from './component/dialogs/dialog-add-movie-to-playlist/dialog-add-movie-to-playlist.component';
import { DialogCreateListComponent } from './component/dialogs/dialog-create-list/dialog-create-list.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
    MoviesPopularListComponentComponent,
    MoviesItemComponentComponent,
    PopularPeopleComponent,
    PeopleItemComponent,
    PeopleDetailsComponent,
    LoginDialogComponent,
    SessionComponent,
    DialogAddMovieToPlaylistComponent,
    DialogCreateListComponent,


  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    ReactiveFormsModule,
    MaterialImportsModule,
    FormsModule,
    MaterialImportsModule,
    NgCircleProgressModule.forRoot({
      "radius": 25,
      "outerStrokeGradient": true,
      "outerStrokeWidth": 5,
      "outerStrokeColor": "#4882c2",
      "outerStrokeGradientStopColor": "#53a9ff",
      "innerStrokeWidth": 0,
      "title": "Rate",
      "titleColor": "#FFFFFF",
      "titleFontSize": "15",
      "titleFontWeight": "bold",
      "showSubtitle": false,
      "animateTitle": true,
      "animationDuration": 1000,
      "showUnits": false,
      "showBackground": true,
      "backgroundColor": "#000000"
    }),
    FlexLayoutModule
  ],

  entryComponents:[

  ],



  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
