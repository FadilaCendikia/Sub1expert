part of 'recommendations_movie_bloc.dart';

@immutable
abstract class RecommendationsMovieState extends Equatable {
  const RecommendationsMovieState();
  @override
  List<Object> get props => [];
}

class RecommendationsMovieEmpty extends RecommendationsMovieState {
  @override
  List<Object> get props =>[];
}

class RecommendationsMovieLoading extends RecommendationsMovieState {
  @override
  List<Object> get props =>[];
}

class RecommendationsMovieError extends RecommendationsMovieState {
  String message;
  RecommendationsMovieError(this.message);
  @override
  List<Object> get props =>[];
}

class RecommendationMovieHasData extends RecommendationsMovieState {
  final List<Movie> result;

  RecommendationMovieHasData(this.result);
  @override
  List<Object> get props =>[];
}
