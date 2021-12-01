import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { GasolinerasListResponse, ListaEESSPrecio } from 'src/app/interfaces/gasolinera.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';
import { GasolinaDetailsComponent } from '../dialogs/gasolina-details/gasolina-details.component';

@Component({
  selector: 'app-gasolinera-item',
  templateUrl: './gasolinera-item.component.html',
  styleUrls: ['./gasolinera-item.component.css']
})
export class GasolineraItemComponent implements OnInit {

  @Input() gasolinaInput!: ListaEESSPrecio;
  i:number = 0;

  constructor(private gasolinaService: GasolineraService, private dialog: MatDialog) { }

  ngOnInit(): void {
  }


  openDetailsDialog() {
    this.dialog.open(GasolinaDetailsComponent, {
      width: '500px',
      disableClose: false,
      data: { gasolinera: this.gasolinaInput
     } })
  }

}