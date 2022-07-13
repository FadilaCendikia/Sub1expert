part of 'airing_today_tv_series_bloc.dart';


abstract class AiringTodayTVSeriesState extends Equatable {
  const AiringTodayTVSeriesState();
  @override
  List<Object> get props => [];
}

class AiringTodayTVSeriesEmpty extends AiringTodayTVSeriesState {
  @override
  List<Object> get props => [];
}

class AiringTodayTVSeriesLoading extends AiringTodayTVSeriesState {
  @override
  List<Object> get props => [];
}

class AiringTodayTVSeriesError extends AiringTodayTVSeriesState {
  final String message;

  AiringTodayTVSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class AiringTodayTVSeriesHasData extends AiringTodayTVSeriesState {
  final List<TVSeries> result;

  AiringTodayTVSeriesHasData(this.result);

  @override
  List<Object> get props => [result];
}

