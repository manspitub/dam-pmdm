import { Injectable } from '@angular/core';
import { AlumnosListComponent } from '../alumnos-list/alumnos-list.component';


const NUM_DE_ALUMNOS = AlumnosListComponent.length

@Injectable({
  providedIn: 'root'
})
export class StudetAlumnoServiceService {

  constructor() { }

  
  getAlumnosList() : number {
    return NUM_DE_ALUMNOS;
  }
  
}
