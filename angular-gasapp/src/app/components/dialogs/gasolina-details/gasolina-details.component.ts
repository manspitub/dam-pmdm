import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ListaEESSPrecio } from 'src/app/interfaces/gasolinera.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';
import firebase from 'firebase/compat/app';
import { AngularFirestore } from '@angular/fire/compat/firestore';



export interface DialogData{
  gasolinera: ListaEESSPrecio;
 }


@Component({
  selector: 'app-gasolina-details',
  templateUrl: './gasolina-details.component.html',
  styleUrls: ['./gasolina-details.component.css']
})

export class GasolinaDetailsComponent implements OnInit {
  gasolinera!: ListaEESSPrecio

  constructor(@Inject (MAT_DIALOG_DATA) private data: DialogData, private gasolinaService: GasolineraService, private firestore: AngularFirestore) { }

  ngOnInit(): void {
    this.gasolinera = this.data.gasolinera;
  }

  

}
