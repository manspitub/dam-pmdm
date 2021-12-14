import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ListaEESSPrecio } from 'src/app/interfaces/gasolinera.interface';
import { List } from 'src/app/interfaces/list';
import { GasolineraService } from 'src/app/services/gasolinera.service';

@Component({
  selector: 'app-dialog-create-list',
  templateUrl: './dialog-create-list.component.html',
  styleUrls: ['./dialog-create-list.component.css'],
})
export class DialogCreateListComponent implements OnInit {
  constructor(public gasolineraService: GasolineraService) {}

  gasolineraList: ListaEESSPrecio[] = []

  ngOnInit(): void {
    this.gasolineraService.getGasolineras().subscribe(resp => {
      let jsonString = JSON.stringify(resp);
      this.gasolineraList = this.gasolineraService.parseAnyToGasolineraListResponse(jsonString);
      console.log(this.gasolineraList);
    });
    this.resetForm();
  }
  crear(listForm: NgForm) {
    this.gasolineraService.createList(listForm.value);
    this.resetForm(listForm);
  }

  resetForm(listForm?: NgForm) {
    if (listForm != null) {
      listForm.reset();
      this.gasolineraService.selectedList = new List();
    }
  }
}
