import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_data_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/delete_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv_series.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'watchlist_tv_series_event.dart';
part 'watchlist_tv_series_state.dart';

class WatchlistTVSeriesBloc extends Bloc<WatchlistTVSeriesEvent, WatchlistTVSeriesState> {
  final GetDataWatchlistTVSeries _dataWatchlistTVSeries;
  final GetWatchListStatus _getWatchListStatus;
  final DeleteTVSeriesFromWatchlist _deleteTVSeriesFromWatchlist;
  final SaveTVSeriesFromWatchlist _fromWatchlist;
  WatchlistTVSeriesBloc( this._dataWatchlistTVSeries, this._getWatchListStatus,
      this._deleteTVSeriesFromWatchlist, this._fromWatchlist) : super(WatchlistTVSeriesEmpty()) {
    on<OnWatchlistTVSeries>((event, emit) async {
      emit(WatchlistTVSeriesLoading());
      final result = await _dataWatchlistTVSeries.execute();
      result.fold((failure) {
        emit(WatchlistTVSeriesError(failure.message));
      }, (data) {
        if (data.isEmpty) {
        }else{
          emit(WatchlistTVSeriesHasData(data));
        }
      }
      );
      // TODO: implement event handler
    });
    on<WatchlistTVSeries>((event, emit) async{
      final id = event.id;
      final result = await _getWatchListStatus.execute(id);
      emit(WatchlistInsert(result));
    });
    on<WatchlistInsertTVSeries>((event, emit) async {
      emit(WatchlistTVSeriesLoading());
      final movie = event.movie;
      final result = await _fromWatchlist.execute(movie);
      result.fold((failure){
        emit (WatchlistTVSeriesError(failure.message));
      }, (message){
        emit(WatchlistMessage(message));
      }
      );
    });
    on<DeleteWatchlistTVSeries>((event, emit) async {
      final movie = event.movie;
      final result = await _deleteTVSeriesFromWatchlist.execute(movie);

      result.fold((failure) {
        emit(WatchlistTVSeriesError(failure.message));
      }, (message) {
        emit(WatchlistMessage(message));
      },
      );
    });
  }
}
