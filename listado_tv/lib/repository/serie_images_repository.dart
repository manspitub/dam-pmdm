import 'package:listado_tv/models/serie.dart';
import 'package:listado_tv/models/serie_image.dart';

abstract class SerieImageRepository {
  Future<SerieImageResponse> fetchSerieImage(int id);
}