part of 'recomendation_movies_bloc.dart';

abstract class RecomendationMoviesState extends Equatable {
  const RecomendationMoviesState();

  @override
  List<Object> get props => [];
}

class RecomendationMoviesEmpty extends RecomendationMoviesState {
  @override
  List<Object> get props => [];
}

class RecomendationMoviesLoading extends RecomendationMoviesState {
  @override
  List<Object> get props => [];
}

class RecomendationMoviesError extends RecomendationMoviesState {
  String message;
  RecomendationMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class RecomendationMoviesHasData extends RecomendationMoviesState {
  final List<Movie> result;

  RecomendationMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}
