import {Component} from '@angular/core';

export interface Alumnos {
  name: string;
  position: number;
  apellidos: string;
  edad: number;
  curso: string;
}

const ELEMENT_DATA: Alumnos[] = [
  {position: 1, name: 'Manuel', apellidos: "Spínola Tubío", edad: 20, curso: "2ºDAM"},
  {position: 2, name: 'Arturo', apellidos: "Pérez Reverte", edad: 34, curso: "2ºDAM"},
  {position: 3, name: 'Cristiano', apellidos: "Ronaldo Junior", edad: 45, curso: "2ºDAM"},
  {position: 4, name: 'Pepe', apellidos: "Chamizo, Guzmán", edad: 59, curso: "2ºDAM"},
  {position: 5, name: 'John', apellidos: "Doe", edad: 55, curso: "2ºDAM"},
  {position: 6, name: 'Jane', apellidos: "Doe Mayweather", edad: 23, curso: "2ºDAM"},
  {position: 7, name: 'Pep', apellidos: "Guardiola I Salas", edad: 27, curso: "2ºDAM"},
  {position: 8, name: 'María', apellidos: "De la hoz", edad: 40, curso: "2ºDAM"},
  {position: 9, name: 'Antonio José', apellidos: "Carrasco", edad: 67, curso: "2ºDAM"},
  {position: 10, name: 'David', apellidos: "Otero García", edad: 9, curso: "2ºDAM"},
];

/**
 * @title Basic use of `<table mat-table>`
 */
@Component({
  selector: 'alumnos-list',
  styleUrls: ['alumnos-list.css'],
  templateUrl: 'alumnos-list.html',
})
export class AlumnosList {
  displayedColumns: string[] = ['position', 'name', 'apellidos', 'edad', 'curso'];
  dataSource = ELEMENT_DATA;
}


/**  Copyright 2021 Google LLC. All Rights Reserved.
    Use of this source code is governed by an MIT-style license that
    can be found in the LICENSE file at http://angular.io/license */