import { ListaEESSPrecio } from "./gasolinera.interface";

export class List{
  $key!: string;
  nombre!: string;
  descripcion!: string;
  gasolineras!: ListaEESSPrecio[];
}
