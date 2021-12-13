import { isNull } from '@angular/compiler/src/output/output_ast';
import { Component, Inject, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/compat/firestore';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { User } from 'firebase/auth';
import { ref } from 'firebase/database';
import { Observable } from 'rxjs';
import { ListaEESSPrecio } from 'src/app/interfaces/gasolinera.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';

const COLLECTION_GASOLINERA_LIKES = 'gasolineraLike'
const COLLECTION_USERS = 'users'

export interface GasolinerasData{
  gasoliners: ListaEESSPrecio[];
}

@Component({
  selector: 'app-gasolineras-fav',
  templateUrl: './gasolineras-fav.component.html',
  styleUrls: ['./gasolineras-fav.component.css']
})
export class GasolinerasFavComponent implements OnInit {

  user = localStorage.getItem('name')


  constructor(private firestore: AngularFirestore, private gasolineraService: GasolineraService) { }

  gasolinerasLike!: Observable<ListaEESSPrecio[]>;

  ngOnInit(): void {

    this.gasolinerasLike = this.firestore.collection<ListaEESSPrecio>(COLLECTION_GASOLINERA_LIKES, ref=> ref.where('uid', '==',localStorage.getItem('uid'))).valueChanges();
  }

  deleteFavorito(){
    this.gasolineraService.deleteFavorites(this.gasolinerasLike.)
  }




}
