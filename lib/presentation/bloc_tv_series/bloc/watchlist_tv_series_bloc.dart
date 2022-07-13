import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_tv_series_event.dart';
part 'watchlist_tv_series_state.dart';

class WatchlistTvSeriesBloc
    extends Bloc<WatchlistTvSeriesEvent, WatchlistTvSeriesState> {
  final GetWatchlistTvSeries _getWatchlistTvSeries;
  final GetWatchListTvSeriesStatus _getWatchListTvSeriesStatus;
  final RemoveWatchlistTvSeries _removeWatchlistTvSeries;
  final SaveWatchlistTvSeries _saveWatchlistTvSeries;

  WatchlistTvSeriesBloc(
    this._getWatchlistTvSeries,
    this._getWatchListTvSeriesStatus,
    this._removeWatchlistTvSeries,
    this._saveWatchlistTvSeries,
  ) : super(WatchlistTvSeriesEmpty()) {
    on<OnWatchlistTvSeries>((event, emit) async {
      emit(WatchlistTvSeriesLoading());

      final result = await _getWatchlistTvSeries.execute();

      result.fold(
        (failure) {
          emit(WatchlistTvSeriesError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(WatchlistTvSeriesEmpty());
          } else {
            emit(WatchlistTvSeriesHasData(data));
          }
        },
      );
    });

    on<WatchlistTvSeries>((event, emit) async {
      final id = event.id;

      final result = await _getWatchListTvSeriesStatus.execute(id);

      emit(InsertWatchlist(result));
    });

    on<InsertWatchlistTvSeries>((event, emit) async {
      emit(WatchlistTvSeriesLoading());
      final movie = event.movie;

      final result = await _saveWatchlistTvSeries.execute(movie);

      result.fold(
        (failure) {
          emit(WatchlistTvSeriesError(failure.message));
        },
        (message) {
          emit(MessageWatchlist(message));
        },
      );
    });

    on<DeleteWatchlistTvSeries>((event, emit) async {
      final movie = event.movie;

      final result = await _removeWatchlistTvSeries.execute(movie);

      result.fold(
        (failure) {
          emit(WatchlistTvSeriesError(failure.message));
        },
        (message) {
          emit(MessageWatchlist(message));
        },
      );
    });
  }
}
