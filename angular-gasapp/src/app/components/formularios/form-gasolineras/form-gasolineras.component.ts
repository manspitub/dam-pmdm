import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Observable, of } from 'rxjs';
import { GasolinerasListResponse, ListaEESSPrecio } from 'src/app/interfaces/gasolinera.interface';
import { MunicipioResponse } from 'src/app/interfaces/municipios.interface';
import { ProvinciaResponse } from 'src/app/interfaces/provincia.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';
import {map, startWith} from 'rxjs/operators';


@Component({
  selector: 'app-form-gasolineras',
  templateUrl: './form-gasolineras.component.html',
  styleUrls: ['./form-gasolineras.component.css']
})
export class FormGasolinerasComponent implements OnInit {

  provincias: ProvinciaResponse[] = [];
  gasolineraList: ListaEESSPrecio[] = [];
  provinciaSelected = new FormControl([]);
  provinciaFirstSelected = '';
  municipioList: MunicipioResponse[] = [];
  municipioSelected = new FormControl([]);
  municipioFiltered: MunicipioResponse[] = [];

  constructor(private gasolineraService: GasolineraService) { }

  async ngOnInit(): Promise<void> {

      this.gasolineraService.getProvincias().subscribe(pro=>{
        this.provincias=pro


      console.log(this.provincias);
  })
  this.gasolineraService.getGasolineras().subscribe(resp => {
    let jsonString = JSON.stringify(resp);

    this.gasolineraList = this.gasolineraService.parseAnyToGasolineraListResponse(jsonString);
    console.log(this.gasolineraList);
  })
this.municipioSelected.valueChanges.pipe(
    startWith(''),
    map(value => (typeof value === 'string' ? value : value.Municipio) ),
    map(name => (name ? this._municipioFiltered(name): this.municipioList.slice())),
  ).subscribe(resp => {
    this.municipioFiltered=resp;
  })
  ;


}

  private _municipioFiltered(value:string): MunicipioResponse[] {
    const filterValue = value.toLowerCase();
    let municipios = this.municipioList.filter(municipio => municipio.Municipio.toLowerCase().includes(filterValue));
    console.log(filterValue, municipios, this.municipioList);
    return municipios;
  }

  getFirstProvinciaName() {
    return this.provincias.find(p => p.IDPovincia ==this.provinciaSelected.value[0])?.Provincia;
  }

  onProvinciaChange() {
    this.municipioFiltered = [];
    let count = 0;
    this.gasolineraService.requestMultipleMunicipioProvincia(this.provinciaSelected.value as String[]).subscribe(
      respuestaPeticionesMunicipios => {
        respuestaPeticionesMunicipios.forEach(resp => {
          count += resp.length;
          this.municipioFiltered.concat(resp);
          this.municipioSelected.setValue('');
        });

        console.log(this.municipioFiltered.length, count);
      });
  }

  displayFn(municipioId: string): string {
    let municipioFind = this.municipioList?.find(m => m.IDMunicipio == municipioId);
    return municipioFind && municipioFind.Municipio ? municipioFind.Municipio : '';
  }





}
