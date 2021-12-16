import { NgModule } from '@angular/core';
import { AngularFireAuthGuard } from '@angular/fire/compat/auth-guard';
import { RouterModule, Routes } from '@angular/router';
import { map } from 'rxjs/operators';
import { FormGasolinerasComponent } from './components/formularios/form-gasolineras/form-gasolineras.component';
import { GasolineraListComponent } from './components/gasolinera-list/gasolinera-list.component';
import { GasolinerasFavComponent } from './components/gasolineras-fav/gasolineras-fav.component';



const routes: Routes = [
  {path:'', component: GasolineraListComponent},
  {path: 'favorites', component: GasolinerasFavComponent, canActivate: [AngularFireAuthGuard]},
  {path:'form-gasolineras', component: FormGasolinerasComponent}
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
