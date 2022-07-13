part of 'top_rated_movie_bloc.dart';

@immutable
abstract class TopRatedMovieState extends Equatable {
  const TopRatedMovieState();
  @override
  List<Object> get props=>[];
}

class TopRatedMovieEmpty extends TopRatedMovieState {
  @override
  List<Object> get props=>[];
}

class TopRatedMoviesLoading extends TopRatedMovieState {
  @override
  List<Object> get props => [];
}

class TopRatedMoviesError extends TopRatedMovieState {
  final String message;

  TopRatedMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class TopRatedMoviesHasData extends TopRatedMovieState {
  final List<Movie> result;

  TopRatedMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}
