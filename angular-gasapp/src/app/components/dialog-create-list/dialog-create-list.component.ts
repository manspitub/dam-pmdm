import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { map } from 'rxjs/operators';
import { ListaEESSPrecio } from 'src/app/interfaces/gasolinera.interface';
import { List } from 'src/app/interfaces/list';
import ListaFirebaseDto from 'src/app/interfaces/listas-firebase.dto';
import { GasolineraService } from 'src/app/services/gasolinera.service';

@Component({
  selector: 'app-dialog-create-list',
  templateUrl: './dialog-create-list.component.html',
  styleUrls: ['./dialog-create-list.component.css'],
})
export class DialogCreateListComponent implements OnInit {
  constructor(public gasolineraService: GasolineraService) {}

  gasolineraList: ListaEESSPrecio[] = []
  gasoliners: ListaEESSPrecio[] = []
  listasList: ListaFirebaseDto[] = [];

  ngOnInit(): void {
    this.gasolineraService.getGasolineras().subscribe(resp => {
      let jsonString = JSON.stringify(resp);
      this.gasolineraList = this.gasolineraService.parseAnyToGasolineraListResponse(jsonString);
      console.log(this.gasolineraList);
    });

} 

  getAllLists(): void {
    this.gasolineraService.getAllList().snapshotChanges().pipe(
      map(changes =>
        changes.map(c =>
          ({ id: c.payload.doc.id, ...c.payload.doc.data() })
        )
      )
    ).subscribe(data => {
      this.listasList = data;
    });
  }

}
