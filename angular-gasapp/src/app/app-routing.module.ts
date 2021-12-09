import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FormGasolinerasComponent } from './components/formularios/form-gasolineras/form-gasolineras.component';
import { GasolineraListComponent } from './components/gasolinera-list/gasolinera-list.component';

const routes: Routes = [
  {path:'', component: GasolineraListComponent},
  {path:'form-gasolineras', component: FormGasolinerasComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
