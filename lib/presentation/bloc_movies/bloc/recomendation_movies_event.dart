part of 'recomendation_movies_bloc.dart';

abstract class RecomendationMoviesEvent extends Equatable {
  const RecomendationMoviesEvent();
}

class OnRecomendationMoviesShow extends RecomendationMoviesEvent {
  final int id;

  OnRecomendationMoviesShow(this.id);

  @override
  List<Object?> get props => [];
}
