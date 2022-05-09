import 'dart:convert';
import 'package:http/http.dart';
import 'package:listado_tv/models/series.dart';

import 'series_repository.dart';



class SeriesRepositoryImpl extends SeriesRepository {
  final Client _client = Client();


  @override
  Future<List<Results>> fetchSeries() async {
    final response = await _client.get(Uri.parse('https://api.themoviedb.org/3/tv/popular?api_key=6f3f957d9d8dc6a98fed68a333b8209c&language=en-US&page=1'));
    if (response.statusCode == 200) {
      return SeriesResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw Exception('Fail to load movies');
    }
  }
}
