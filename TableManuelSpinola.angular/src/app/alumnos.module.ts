import {HttpClientModule} from '@angular/common/http';
import {NgModule} from '@angular/core';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {MatNativeDateModule} from '@angular/material/core';
import {BrowserModule} from '@angular/platform-browser';
import {platformBrowserDynamic} from '@angular/platform-browser-dynamic';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';


import {AlumnosList} from './alumnos-list';
import { ToolbarOverviewExample } from './toolbar';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatTableModule } from '@angular/material/table';

import { enableProdMode } from '@angular/core';


@NgModule({
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    FormsModule,
    HttpClientModule,
    MatNativeDateModule,
    ReactiveFormsModule,
    MatCheckboxModule,
    MatTableModule, 
    ReactiveFormsModule
  ],
  entryComponents: [AlumnosList, [ToolbarOverviewExample]], 
  declarations: [AlumnosList, [ToolbarOverviewExample]], 
  bootstrap: [AlumnosList, [ToolbarOverviewExample]]
})
export class AppModule {}

platformBrowserDynamic().bootstrapModule(AppModule)
.catch(err => console.error(err));