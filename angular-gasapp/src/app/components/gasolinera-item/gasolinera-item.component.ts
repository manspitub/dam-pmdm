import { Component, Input, OnInit } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/compat/auth';
import { AngularFirestore } from '@angular/fire/compat/firestore';
import { MatDialog } from '@angular/material/dialog';
import { Observable } from 'rxjs';
import {
  GasolinerasListResponse,
  ListaEESSPrecio,
} from 'src/app/interfaces/gasolinera.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';
import { GasolinaDetailsComponent } from '../dialogs/gasolina-details/gasolina-details.component';
import { GasolinerasFavComponent } from '../gasolineras-fav/gasolineras-fav.component';

const COLLECTION_GASOLINERA_LIKES = 'gasolineraLike';

@Component({
  selector: 'app-gasolinera-item',
  templateUrl: './gasolinera-item.component.html',
  styleUrls: ['./gasolinera-item.component.css'],
})
export class GasolineraItemComponent implements OnInit {
  @Input() gasolinaInput!: ListaEESSPrecio;
  gasolineras!: Observable<ListaEESSPrecio[]>;
  i: number = 0;

  constructor(
    private gasolinaService: GasolineraService,
    private dialog: MatDialog,
    private auth: AngularFireAuth,
    private firestore: AngularFirestore
  ) {}

  ngOnInit(): void {}

  openDetailsDialog() {
    this.dialog.open(GasolinaDetailsComponent, {
      width: '500px',
      disableClose: false,
      data: { gasolinera: this.gasolinaInput },
    });
  }

  getGoogleMaps(direccion: String) {
    this.gasolinaService.getGoogleMaps(direccion.replace(' ', '+'));
  }

  getGasolinerPhoto(){
    if (this.gasolinaInput.rotulo == 'REPSOL'){
      return 'https://cflvdg.avoz.es/sc/SzffnIIxc5UYIzMDcBcvbKHfh3E=/1280x/2018/12/26/00121545856322016951233/Foto/P12D7191.jpg'
  } else if(this.gasolinaInput.rotulo == 'CEPSA'){
    return 'https://atenoil.com/wp-content/uploads/2017/08/sanse-cepsa-01.jpg'
  }
  return 'https://globalestacionesdeservicio.com/wp-content/uploads/2015/10/gasolineras.jpg'
}

  like(gasolinera: ListaEESSPrecio) {
    if (localStorage.getItem('uid') == null) {
      alert('Debes iniciar sesion para likear');
    } else {
      this.firestore
        .collection(COLLECTION_GASOLINERA_LIKES)
        .doc(gasolinera.ideess)
        .set({
          provincia: gasolinera.provincia,
          direccion: gasolinera.direccion,
          horario: gasolinera.horario,
          cP: gasolinera.cP,
          precioGasoleoA: gasolinera.precioGasoleoA,
          precioGasolina95E5: gasolinera.precioGasolina95E5,
          precioGasolina98E5: gasolinera.precioGasolina98E5,
          rotulo: gasolinera.rotulo,
          ideess: gasolinera.ideess,
          idMunicipio: gasolinera.idMunicipio,
          idProvincia: gasolinera.idProvincia,
          idccaa: gasolinera.idccaa,
          uid: localStorage.getItem('uid'),
          nombre: localStorage.getItem('name'),
        });

      this.gasolineras = this.firestore
        .collection<ListaEESSPrecio>(COLLECTION_GASOLINERA_LIKES)
        .valueChanges();
      this.dialog.open(GasolinerasFavComponent, {
        width: '500px',
        disableClose: false,
      });
    }
  }

  deleteFavorite(gasolinera: ListaEESSPrecio){
    

    this.gasolinaService.deleteFavorites(gasolinera.ideess).then(resp=>{
      alert(`Se ha eliminado la gasolinera ${gasolinera.rotulo}`)
    })
  }
}
