import { Component, AfterViewInit, OnInit } from '@angular/core';
import { ALUMNOS } from '../model/alumnos';
import { StudetAlumnoServiceService } from '../service/alumno-service.service';

export interface Alumno {
  id:string;
  nombre:string;
  apellidos: string;
  edad: number;
  curso: string;
}



@Component({
  selector: 'alumnos-list',
  styleUrls: ['./alumnos-list.css'],
  templateUrl: './alumnos-list.html',
})
export class AlumnosListComponent implements OnInit{
  displayedOriginalColumns: string[] = ['colNombre', 'colApellidos', 'colEdad', 'colAcciones']
  displayedColumns: string[] = ['colNombre', 'colApellidos', 'colEdad', 'colAcciones'];
  dataSource = ALUMNOS ;
  nombre = '';

  constructor(){
  }

  ngOnInit():void {
    this.getAlumnosList;
  }

  checkboxChange(isChecked: boolean, columnNombre: string) {
    if(isChecked) {
      this.displayedColumns.splice(this.displayedOriginalColumns.indexOf(columnNombre), 0, columnNombre);
    } else {
      this.displayedColumns.splice(this.displayedColumns.indexOf(columnNombre), 1);
    }
    console.log(this.displayedColumns);
  }

  getAlumnosList(){
    console.log(this.getAlumnosList);
  }  

}   
  



/**  Copyright 2021 Google LLC. All Rights Reserved.
    Use of this source code is governed by an MIT-style license that
    can be found in the LICENSE file at http://angular.io/license */