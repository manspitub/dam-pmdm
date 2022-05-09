import 'package:listado_tv/models/serie.dart';
import 'package:listado_tv/models/serie_videos.dart';

abstract class SerieVideosRepository {
  Future<SerieVideos> fetchSerieVideos(int id);
}