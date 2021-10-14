import { Component, AfterViewInit } from '@angular/core';
import { FormGroup, FormControl, AbstractControl } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import { Observable, merge } from 'rxjs';'rxjs';

class Alumnos {
  name: string;
  position: number;
  apellidos: string;
  edad: number;
  curso: string;
  complete: boolean;
}



/**
 * @title Basic use of `<table mat-table>`
 */
@Component({
  selector: 'alumnos-list',
  styleUrls: ['./alumnos-list.css'],
  templateUrl: './alumnos-list.html',
})
export class AlumnosList implements AfterViewInit{
  constructor() {

  
    const alumnos: Alumnos[] = [
    {position: 1, name: 'Manuel', apellidos: "Spínola Tubío", edad: 20, curso: "2ºDAM", complete: false},
    {position: 2, name: 'Arturo', apellidos: "Pérez Reverte", edad: 34, curso: "2ºDAM", complete: false},
    {position: 3, name: 'Cristiano', apellidos: "Ronaldo Junior", edad: 45, curso: "2ºDAM", complete: false},
    {position: 4, name: 'Pepe', apellidos: "Chamizo, Guzmán", edad: 59, curso: "2ºDAM", complete: false},
    {position: 5, name: 'John', apellidos: "Doe", edad: 55, curso: "2ºDAM", complete: false},
    {position: 6, name: 'Jane', apellidos: "Doe Mayweather", edad: 23, curso: "2ºDAM", complete: false},
    {position: 7, name: 'Pep', apellidos: "Guardiola I Salas", edad: 27, curso: "2ºDAM", complete: false},
    {position: 8, name: 'María', apellidos: "De la hoz", edad: 40, curso: "2ºDAM", complete: false},
    {position: 9, name: 'Antonio José', apellidos: "Carrasco", edad: 67, curso: "2ºDAM", complete: false},
    {position: 10, name: 'David', apellidos: "Otero García", edad: 9, curso: "2ºDAM", complete: false}];
   this.dateSource = new MatTableDataSource(alumnos);
    }
  //displayedColumns: string[] = ['position', 'name', 'apellidos', 'edad', 'curso'];
  form:FormGroup = new FormGroup({
    position: new FormControl(false),
    name: new FormControl(false),
    apellidos: new FormControl(false),
    edad: new FormControl(false),
    curso: new FormControl(false)
  });

  position = this.form.get('position');
  name = this.form.get('name');
  apellidos = this.form.get('apellidos');
  edad = this.form.get('edad');
  curso = this.form.get('curso');

  cbValues: any;
  columns: string[];

  columnDefinitions = [
    { def: 'position', label: 'Position', hide: this.position?.value},
    { def: 'name', label: 'Name', hide: this.name?.value},
    { def: 'apellidos', label: 'Apellidos', hide: this.apellidos?.value},
    { def: 'edad', label: 'Edad', hide: this.edad?.value},
    { def: 'curso', label: 'Curso', hide: this.curso?.value}
  ]

  getDisplayedColumns() {
    this.columns = this.columnDefinitions.filter(cd=>!cd.hide).map(cd=>cd.def);
  }

  dateSource: MatTableDataSource<Alumnos>

  ngAfterViewInit() {
    let o1:Observable<boolean> = this.position?.valueChanges;
    let o2:Observable<boolean> = this.name?.valueChanges;
    let o3:Observable<boolean> = this.apellidos?.valueChanges;
    let o4:Observable<boolean> = this.edad?.valueChanges;
    let o5:Observable<boolean> = this.curso?.valueChanges;

    merge(o1, o2, o3, o4, o5).subscribe( v=> {
      this.columnDefinitions[0].hide = this.position?.value;
      this.columnDefinitions[1].hide = this.name?.value;
      this.columnDefinitions[2].hide = this.apellidos?.value;
      this.columnDefinitions[3].hide = this.edad?.value;
      this.columnDefinitions[4].hide = this.curso?.value;
        console.log(this.columnDefinitions);

        this.getDisplayedColumns();
    });

    this.getDisplayedColumns();
  }
}


/**  Copyright 2021 Google LLC. All Rights Reserved.
    Use of this source code is governed by an MIT-style license that
    can be found in the LICENSE file at http://angular.io/license */