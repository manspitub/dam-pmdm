
import 'package:listado_tv/models/series.dart';

abstract class SeriesRepository {
  Future<List<Results>> fetchSeries();
}