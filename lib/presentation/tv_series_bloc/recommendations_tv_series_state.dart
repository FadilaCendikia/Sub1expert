part of 'recommendations_tv_series_bloc.dart';

@immutable
abstract class RecommendationsTVSeriesState {
  const RecommendationsTVSeriesState();
  @override
  List<Object> get props => [];
}

class RecommendationsTVSeriesEmpty extends RecommendationsTVSeriesState {
  @override
  List<Object> get props => [];
}
class RecommendationsTVSeriesLoading extends RecommendationsTVSeriesState{
  @override
  List<Object> get props => [];
}
class RecommendationsTVSeriesError extends RecommendationsTVSeriesState{
  String message;
  RecommendationsTVSeriesError(this.message);
  @override
  List<Object> get props => [];
}
class RecommendationsTVSeriesHasData extends RecommendationsTVSeriesState{
  final List<TVSeries> result;
  RecommendationsTVSeriesHasData(this.result);
  @override
  List<Object> get props => [];
}
