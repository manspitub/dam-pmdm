import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AngularFirestore, AngularFirestoreCollection } from '@angular/fire/compat/firestore';
import { forkJoin, Observable } from 'rxjs';
import { CreatedListDto, GasolinerasListResponse } from '../interfaces/gasolinera.interface';
import { GasolineraFav } from '../interfaces/gasolineraFav';
import { MunicipioResponse } from '../interfaces/municipios.interface';
import { ProvinciaResponse } from '../interfaces/provincia.interface';
import { List } from '../interfaces/list';
import ListaFirebaseDto from '../interfaces/listas-firebase.dto';


@Injectable({
  providedIn: 'root'
})
export class GasolineraService {

  listaRef!: AngularFirestoreCollection<ListaFirebaseDto>;

  constructor(private http: HttpClient, private firestore: AngularFirestore) {
    this.listaRef = this.firestore.collection('listas');
   }

  getGasolineras(): Observable<any> {
    return this.http.get<any>('https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/');
  }

  getProvincias(): Observable<ProvinciaResponse[]> {
    return this.http.get<ProvinciaResponse[]>(`https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/Listados/Provincias/`)
  }

  getMunicipios(provinciaId: String): Observable<MunicipioResponse[]> {
    return this.http.get<MunicipioResponse[]>(`https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/Listados/MunicipiosPorProvincia/${provinciaId}`)
  }

  getGoogleMaps(direccion:String){
    return window.location.href=(`https://www.google.es/maps/search/${direccion}/`)
  }

  getMunicipiosByProvinciaId(provinciaId: String): Observable<MunicipioResponse[]> {
    return this.http.get<MunicipioResponse[]>(`https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/Listados/MunicipiosPorProvincia/${provinciaId}`);
  }

  public requestMultipleMunicipioProvincia(provinciasIds: String[]): Observable<MunicipioResponse[][]> {
    let responseMunicipios: Observable<MunicipioResponse[]>[] = [];
    provinciasIds.forEach(pId => {
      responseMunicipios.push(this.getMunicipiosByProvinciaId(pId));
    });
    return forkJoin(responseMunicipios);
  }


  parseAnyToGasolineraListResponse(jsonString: string) {
    let jsonStringReplaced = jsonString.replace(/Precio Gasoleo A/gi, 'precioGasoleoA');
    jsonStringReplaced = jsonStringReplaced.replace(/ListaEESSPrecio/gi, 'listaEESSPrecio');
    jsonStringReplaced = jsonStringReplaced.replace(/C\.P\./gi, 'cP');
    jsonStringReplaced = jsonStringReplaced.replace(/Dirección/gi, 'direccion');
    jsonStringReplaced = jsonStringReplaced.replace(/Rótulo/gi, 'rotulo');
    jsonStringReplaced = jsonStringReplaced.replace(/Precio Gasolina 95E5/gi, 'precioGasolina95E5');
    jsonStringReplaced = jsonStringReplaced.replace(/Horario/gi, 'horario');
    jsonStringReplaced = jsonStringReplaced.replace(/Precio Gasolina 95 E5/gi, 'precioGasolina95E5');
    jsonStringReplaced = jsonStringReplaced.replace(/Precio Gasolina 95E5/gi, 'precioGasolina95E5');
    jsonStringReplaced = jsonStringReplaced.replace(/Precio Gasolina 98 E5/gi, 'precioGasolina98E5');
    jsonStringReplaced = jsonStringReplaced.replace(/Provincia/gi, 'provincia');
    jsonStringReplaced = jsonStringReplaced.replace(/IDEESS/gi, 'ideess');
    jsonStringReplaced = jsonStringReplaced.replace(/IDMunicipio/gi, 'idMunicipio');
    jsonStringReplaced = jsonStringReplaced.replace(/IDProvincia/gi, 'idProvincia');
    jsonStringReplaced = jsonStringReplaced.replace(/IDCCAA/gi, 'idccaa');



    let jsonFinal: GasolinerasListResponse = JSON.parse(jsonStringReplaced);
    return jsonFinal.listaEESSPrecio;
  }

  list!: AngularFirestore;
  listas: AngularFirestore[] = []
  selectedList: List = new List();

  getFavorites(): Observable<GasolineraFav[]>{

    return this.firestore.collection<GasolineraFav>('gasolineraLike').valueChanges();
  }

  deleteFavorites(docId: string){
    let userId = localStorage.getItem('uid')
    return this.firestore.collection('gasolineraLike').doc(docId).delete();
  }



  getAllList(): AngularFirestoreCollection<ListaFirebaseDto>{
    return this.listaRef
  }



}
