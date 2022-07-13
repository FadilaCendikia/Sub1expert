part of 'recomendation_tv_series_bloc.dart';

abstract class RecomendationTvSeriesState extends Equatable {
  const RecomendationTvSeriesState();

  @override
  List<Object> get props => [];
}

class RecomendationTvSeriesEmpty extends RecomendationTvSeriesState {
  @override
  List<Object> get props => [];
}

class RecomendationTvSeriesLoading extends RecomendationTvSeriesState {
  @override
  List<Object> get props => [];
}

class RecomendationTvSeriesError extends RecomendationTvSeriesState {
  String message;
  RecomendationTvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class RecomendationTvSeriesHasData extends RecomendationTvSeriesState {
  final List<TvSeries> result;

  RecomendationTvSeriesHasData(this.result);

  @override
  List<Object> get props => [result];
}
