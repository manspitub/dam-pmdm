import 'dart:convert';
import 'package:http/http.dart';
import 'package:listado_tv/models/serie.dart';
import 'package:listado_tv/repository/serie_repository.dart';


class SerieRepositoryImpl extends SerieRepository {
  final Client _client = Client();


  @override
  Future<SerieResponse> fetchSerie(int id) async {
    final response = await _client.get(Uri.parse('https://api.themoviedb.org/3/tv/$id?api_key=6f3f957d9d8dc6a98fed68a333b8209c&language=en-US'));
    if (response.statusCode == 200) {
      return SerieResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to load movies');
    }
  }
}
