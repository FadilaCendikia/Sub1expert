part of 'watchlist_tv_series_bloc.dart';

@immutable
abstract class WatchlistTVSeriesState extends Equatable{
  const WatchlistTVSeriesState();
  @override
  List<Object> get props => [];
}

class WatchlistTVSeriesEmpty extends WatchlistTVSeriesState {
  @override
  List<Object> get props => [];
}
class WatchlistTVSeriesLoading extends WatchlistTVSeriesState{
  @override
  List<Object> get props => [];
}
class WatchlistTVSeriesError extends WatchlistTVSeriesState{
  String  message;
  WatchlistTVSeriesError(this.message);

  @override
  List<Object> get props => [message];
}
class WatchlistTVSeriesHasData extends WatchlistTVSeriesState{
  final List<TVSeries> result;
  WatchlistTVSeriesHasData(this.result);
  @override
  List<Object> get props => [result];
}
class WatchlistInsert extends WatchlistTVSeriesState{
  final bool status;

  WatchlistInsert(this.status);
  @override
  List<Object> get props => [status];
}
class WatchlistMessage extends WatchlistTVSeriesState{
  final String message;
  WatchlistMessage(this.message);
  @override
  List<Object> get props => [message];
}