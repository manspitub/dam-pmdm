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
  getGasolinerPhoto(){
    if (this.gasolinera.rotulo == 'REPSOL'){
      return 'https://cflvdg.avoz.es/sc/SzffnIIxc5UYIzMDcBcvbKHfh3E=/1280x/2018/12/26/00121545856322016951233/Foto/P12D7191.jpg'
  } else if(this.gasolinera.rotulo == 'CEPSA'){
    return 'https://atenoil.com/wp-content/uploads/2017/08/sanse-cepsa-01.jpg'
  }
  return 'https://globalestacionesdeservicio.com/wp-content/uploads/2015/10/gasolineras.jpg'
}



}
