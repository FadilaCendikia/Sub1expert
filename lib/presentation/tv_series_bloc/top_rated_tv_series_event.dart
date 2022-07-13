part of 'top_rated_tv_series_bloc.dart';

@immutable
abstract class TopRatedTVSeriesEvent extends Equatable {
  const TopRatedTVSeriesEvent();
}

class OnTopRatedTVSeriesShow extends TopRatedTVSeriesEvent{
  @override
  List<Object> get props => [];
}
