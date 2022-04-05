import 'package:genre_list_flutter/models/genre_response.dart';

abstract class GenreRepository {
  Future<List<Genres>> fetchGenres();
}