import 'dart:convert';
import 'package:http/http.dart';
import 'package:listado_tv/models/serie_videos.dart';
import 'package:listado_tv/models/series.dart';

import 'serie_videos_repository.dart';




class SerieVideosRepositoryImpl extends SerieVideosRepository {
  final Client _client = Client();


  @override
  Future<SerieVideos> fetchSerieVideos(int id) async {
    final response = await _client.get(Uri.parse('https://api.themoviedb.org/3/tv/$id/videos?api_key=6f3f957d9d8dc6a98fed68a333b8209c&language=en-US'));
    if (response.statusCode == 200) {
      return SerieVideos.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to load movies');
    }
  }
}