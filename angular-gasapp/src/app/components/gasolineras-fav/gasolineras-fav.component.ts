import { Component, Inject, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/compat/firestore';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ListaEESSPrecio } from 'src/app/interfaces/gasolinera.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';

export interface GasolinerasData{
  gasoliners: ListaEESSPrecio[];
}

@Component({
  selector: 'app-gasolineras-fav',
  templateUrl: './gasolineras-fav.component.html',
  styleUrls: ['./gasolineras-fav.component.css']
})
export class GasolinerasFavComponent implements OnInit {

  gasolineras!: ListaEESSPrecio[];


  constructor(@Inject (MAT_DIALOG_DATA) private data: GasolinerasData, private gasolinaService: GasolineraService, private firestore: AngularFirestore) { }

  ngOnInit(): void {

    this.gasolineras = this.data.gasoliners
  }

}
