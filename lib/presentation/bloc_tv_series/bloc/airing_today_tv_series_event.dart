part of 'airing_today_tv_series_bloc.dart';

abstract class AiringTodayTvSeriesEvent extends Equatable {
  const AiringTodayTvSeriesEvent();
}

class OnAiringTodayTvSeriesShow extends AiringTodayTvSeriesEvent {
  @override
  List<Object?> get props => [];
}
