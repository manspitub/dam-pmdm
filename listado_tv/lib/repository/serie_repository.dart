import 'package:listado_tv/models/serie.dart';

abstract class SerieRepository {
  Future<SerieResponse> fetchSerie(int id);
}