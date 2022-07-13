part of 'recommendations_movie_bloc.dart';

@immutable
abstract class RecommendationsMovieEvent extends Equatable {
  const RecommendationsMovieEvent();
}
class OnRecommendationMovieShow extends RecommendationsMovieEvent{
  final int id;

  OnRecommendationMovieShow(this.id);
  @override
  List<Object?> get props=>[];
}
