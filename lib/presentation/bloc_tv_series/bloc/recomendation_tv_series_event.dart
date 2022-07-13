part of 'recomendation_tv_series_bloc.dart';

abstract class RecomendationTvSeriesEvent extends Equatable {
  const RecomendationTvSeriesEvent();
}

class OnRecomendationTvSeriesShow extends RecomendationTvSeriesEvent {
  final int id;

  OnRecomendationTvSeriesShow(this.id);

  @override
  List<Object?> get props => [];
}
