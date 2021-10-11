import {Component} from '@angular/core';

export interface PeriodicElement {
  name: string;
  position: number;
  apellidos: string;
  edad: number;
}

const ELEMENT_DATA: PeriodicElement[] = [
  {position: 1, name: 'Manuel', apellidos: "Spínola Tubío", edad: 20},
  {position: 2, name: 'Arturo', apellidos: "Pérez Reverte", edad: 34},
  {position: 3, name: 'Cristiano', apellidos: "Ronaldo Junior", edad: 45},
  {position: 4, name: 'Pepe', apellidos: "Chamizo, Guzmán", edad: 59},
  {position: 5, name: 'John', apellidos: "Doe", edad: 55},
  {position: 6, name: 'Jane', apellidos: "Doe Mayweather", edad: 23},
  {position: 7, name: 'Pep', apellidos: "Guardiola I Salas", edad: 27},
  {position: 8, name: 'María', apellidos: "De la hoz", edad: 40},
  {position: 9, name: 'Antonio José', apellidos: "Carrasco", edad: 67},
  {position: 10, name: 'David', apellidos: "Otero García", edad: 9},
];

/**
 * @title Basic use of `<table mat-table>`
 */
@Component({
  selector: 'table-basic-example',
  styleUrls: ['table-basic-example.css'],
  templateUrl: 'table-basic-example.html',
})
export class TableBasicExample {
  displayedColumns: string[] = ['position', 'name', 'apellidos', 'edad'];
  dataSource = ELEMENT_DATA;
}


/**  Copyright 2021 Google LLC. All Rights Reserved.
    Use of this source code is governed by an MIT-style license that
    can be found in the LICENSE file at http://angular.io/license */