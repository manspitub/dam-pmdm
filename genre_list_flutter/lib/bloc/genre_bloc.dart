import 'package:bloc/bloc.dart';
import 'package:genre_list_flutter/repository/genre_repository/genre_repository.dart';

import '../models/genre_response.dart';
part 'genre_event.dart';
part 'genre_state.dart';

 class GenreBloc extends Bloc<GenresEvent, GenresState> {

  final GenreRepository genreRepository;


  GenreBloc(this.genreRepository) : super(GenresInitial()) {
    on<FetchGenre>(_genresFetched);
  }

  void _genresFetched(FetchGenre event, Emitter<GenresState> emit) async {
    try {
      final genres = await genreRepository.fetchGenres();
      emit(GenresFetched(genres));
      return;
    } on Exception catch (e) {
      emit(GenreFetchError(e.toString()));
    }
  }
}