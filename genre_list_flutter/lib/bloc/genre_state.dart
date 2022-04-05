part of 'genre_bloc.dart';





abstract class GenresState {
  const GenresState();
  
  
  List<Object> get props => [];
}

class GenresInitial extends GenresState {}


class GenresFetched extends GenresState {
  final List<Genres> genres;


  const GenresFetched(this.genres);

  @override
  List<Object> get props => [genres];
}

class GenreFetchError extends GenresState {
  final String message;
  const GenreFetchError(this.message);

  @override
  List<Object> get props => [message];
}