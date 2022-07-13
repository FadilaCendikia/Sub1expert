part of 'watchlist_tv_series_bloc.dart';

@immutable
abstract class WatchlistTVSeriesEvent extends Equatable {
  const WatchlistTVSeriesEvent();
}
class OnWatchlistTVSeries extends WatchlistTVSeriesEvent{
  @override
  List<Object> get props => [];
}
class WatchlistTVSeries extends WatchlistTVSeriesEvent{
  final int id;
  WatchlistTVSeries(this.id);
  @override
  List<Object> get props => [id];
}
class WatchlistInsertTVSeries extends WatchlistTVSeriesEvent{
  final TVSeriesDetail movie;

  WatchlistInsertTVSeries(this.movie);
  @override
  List<Object> get props => [movie];
}
class DeleteWatchlistTVSeries extends WatchlistTVSeriesEvent{
  final TVSeriesDetail movie;

  DeleteWatchlistTVSeries(this.movie);
  @override
  List<Object> get props => [movie];
}
