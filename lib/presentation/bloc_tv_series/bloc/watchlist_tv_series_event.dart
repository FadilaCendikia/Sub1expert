part of 'watchlist_tv_series_bloc.dart';

abstract class WatchlistTvSeriesEvent extends Equatable {
  const WatchlistTvSeriesEvent();

  @override
  List<Object> get props => [];
}

class OnWatchlistTvSeries extends WatchlistTvSeriesEvent {
  @override
  List<Object> get props => [];
}

class WatchlistTvSeries extends WatchlistTvSeriesEvent {
  final int id;

  WatchlistTvSeries(this.id);

  @override
  List<Object> get props => [id];
}

class InsertWatchlistTvSeries extends WatchlistTvSeriesEvent {
  final TvSeriesDetail movie;

  InsertWatchlistTvSeries(this.movie);

  @override
  List<Object> get props => [movie];
}

class DeleteWatchlistTvSeries extends WatchlistTvSeriesEvent {
  final TvSeriesDetail movie;

  DeleteWatchlistTvSeries(this.movie);

  @override
  List<Object> get props => [movie];
}
