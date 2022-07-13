part of 'watchlist_tv_series_bloc.dart';

abstract class WatchlistTvSeriesState extends Equatable {
  const WatchlistTvSeriesState();

  @override
  List<Object> get props => [];
}

class WatchlistTvSeriesEmpty extends WatchlistTvSeriesState {
  @override
  List<Object> get props => [];
}

class WatchlistTvSeriesLoading extends WatchlistTvSeriesState {
  @override
  List<Object> get props => [];
}

class WatchlistTvSeriesError extends WatchlistTvSeriesState {
  String message;
  WatchlistTvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistTvSeriesHasData extends WatchlistTvSeriesState {
  final List<TvSeries> result;

  WatchlistTvSeriesHasData(this.result);

  @override
  List<Object> get props => [result];
}

class InsertWatchlist extends WatchlistTvSeriesState {
  final bool status;

  InsertWatchlist(this.status);

  @override
  List<Object> get props => [status];
}

class MessageWatchlist extends WatchlistTvSeriesState {
  final String message;

  MessageWatchlist(this.message);

  @override
  List<Object> get props => [message];
}
