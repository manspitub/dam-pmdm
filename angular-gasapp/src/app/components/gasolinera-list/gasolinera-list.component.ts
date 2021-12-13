import { Component, OnInit } from '@angular/core';
import { GasolinerasListResponse, ListaEESSPrecio } from 'src/app/interfaces/gasolinera.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';
import { AngularFireAuth } from '@angular/fire/compat/auth';
import { AngularFirestore } from '@angular/fire/compat/firestore';
import firebase from 'firebase/compat/app';

import { Gasoliner } from 'src/app/interfaces/user.interface';
import { Observable } from 'rxjs';

const COLLECTION_GASOLINERS = 'users'


@Component({
  selector: 'app-gasolinera-list',
  templateUrl: './gasolinera-list.component.html',
  styleUrls: ['./gasolinera-list.component.css']
})
export class GasolineraListComponent implements OnInit {
  gasolineraList: ListaEESSPrecio[] = [];
  gasolineraFecha: GasolinerasListResponse[] = []

  gasoliners!: Observable<Gasoliner[]>

  sesion: string = 'no ha iniciado sesion'


  constructor(private gasolineraService: GasolineraService, public auth: AngularFireAuth, private firestore: AngularFirestore ) { }

  ngOnInit(): void {
    this.gasolineraService.getGasolineras().subscribe(resp => {
      let jsonString = JSON.stringify(resp);
      this.gasolineraList = this.gasolineraService.parseAnyToGasolineraListResponse(jsonString);
      console.log(this.gasolineraList);
    });
  }

  login(){
    this.auth.signInWithPopup(new firebase.auth.GoogleAuthProvider()).then(resp => {
      this.firestore.collection(COLLECTION_GASOLINERS).doc(resp?.user?.uid)
      .set({ name: resp.user?.displayName,
        email: resp.user?.email,
        photo: resp.user?.photoURL
      })
      localStorage.setItem('name', resp.user?.displayName? resp.user?.displayName: '');
      localStorage.setItem('photo', resp.user?.photoURL? resp.user?.photoURL: '');
      localStorage.setItem('uid', resp.user?.uid? resp.user?.uid: '');
    })
  }



  logout(){
    return localStorage.clear()
  }

  getName(){
    if(localStorage.getItem('name')){
      return localStorage.getItem('name')
    }
    else return this.sesion
  }

  getPhoto(){
    return localStorage.getItem('photo')
  }

}
