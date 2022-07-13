part of 'search_movie_bloc.dart';

@immutable
abstract class SearchMovieState extends Equatable {
  const SearchMovieState();
  @override
  List<Object> get props =>[];
}

class SearchMovieEmpty extends SearchMovieState {}

class SearchMoviesLoading extends SearchMovieState {}

class SearchMoviesError extends SearchMovieState {
  final String message;

  SearchMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchMoviesHasData extends SearchMovieState {
  final List<Movie> result;

  SearchMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}
