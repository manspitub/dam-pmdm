   
import 'dart:convert';
import 'package:genre_list_flutter/models/genre_response.dart';
import 'package:http/http.dart';

import 'constants.dart';
import 'genre_repository.dart';

class GenreRepositoryImpl extends GenreRepository {
  final Client _client = Client();

  @override
  Future<List<Genres>> fetchGenres() async {
    final response = await _client.get(Uri.parse('https://api.themoviedb.org/3/genre/movie/list?api_key=${Constant.apiKey}&language=es'));
    if (response.statusCode == 200) {
      return GenreResponse.fromJson(json.decode(response.body)).genres;
    } else {
      throw Exception('Fail to load movies');
    }
  }
}