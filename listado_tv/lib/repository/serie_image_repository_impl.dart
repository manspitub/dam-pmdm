import 'dart:convert';
import 'package:http/http.dart';
import 'package:listado_tv/models/serie_image.dart';
import 'package:listado_tv/models/series.dart';
import 'package:listado_tv/repository/serie_images_repository.dart';

import 'series_repository.dart';

class SerieImageRepositoryImpl extends SerieImageRepository {
  final Client _client = Client();


  @override
  Future<SerieImageResponse> fetchSerieImage(int id) async {
    final response = await _client.get(Uri.parse('https://api.themoviedb.org/3/tv/$id/images?api_key=6f3f957d9d8dc6a98fed68a333b8209c&language=en-US'));
    if (response.statusCode == 200) {
      return SerieImageResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to load movies');
    }
  }
}
