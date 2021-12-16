
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { GasolineraItemComponent } from './components/gasolinera-item/gasolinera-item.component';
import { GasolineraListComponent } from './components/gasolinera-list/gasolinera-list.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialImportsModule } from './modules/material-imports.module';
import { HttpClientModule } from '@angular/common/http';
import { MatCardModule } from '@angular/material/card';
import { GasolinaDetailsComponent } from './components/dialogs/gasolina-details/gasolina-details.component';
import { FormGasolinerasComponent } from './components/formularios/form-gasolineras/form-gasolineras.component';
import { MatSliderModule } from '@angular/material/slider';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { FormControl, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { initializeApp,provideFirebaseApp } from '@angular/fire/app';
import { environment } from '../environments/environment';
import { provideAuth,getAuth } from '@angular/fire/auth';
import { provideDatabase,getDatabase } from '@angular/fire/database';
import { provideFirestore,getFirestore } from '@angular/fire/firestore';
import { AngularFireAuthModule, USE_DEVICE_LANGUAGE, USE_EMULATOR as USE_AUTH_EMULATOR } from '@angular/fire/compat/auth';
import { AngularFireModule } from '@angular/fire/compat';
import { GasolinerasFavComponent } from './components/gasolineras-fav/gasolineras-fav.component';
import { DialogCreateListComponent } from './components/dialog-create-list/dialog-create-list.component';
import { AngularFireAuthGuardModule } from '@angular/fire/compat/auth-guard';


@NgModule({
  declarations: [
    AppComponent,
    GasolineraItemComponent,
    GasolineraListComponent,
    GasolinaDetailsComponent,
    FormGasolinerasComponent,
    GasolinerasFavComponent,
    DialogCreateListComponent,

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialImportsModule,
    HttpClientModule,
    MatCardModule,
    MatSliderModule,
    MatCheckboxModule,
    FormsModule,
    
    ReactiveFormsModule,
    AngularFireAuthGuardModule,
    AngularFireAuthModule,
    AngularFireModule.initializeApp(environment.firebase),
    provideFirebaseApp(() => initializeApp(environment.firebase)),
    provideAuth(() => getAuth()),
    provideDatabase(() => getDatabase()),
    provideFirestore(() => getFirestore())
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
