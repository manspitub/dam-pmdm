part of 'genre_bloc.dart';

abstract class GenresEvent  {
  const GenresEvent();


  List<Object> get props => [];
}

class FetchGenre extends GenresEvent {


  const FetchGenre();

  
  @override
  List<Object> get props => [];
}