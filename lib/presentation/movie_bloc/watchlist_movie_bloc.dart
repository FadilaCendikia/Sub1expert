import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:equatable/equatable.dart';
part 'watchlist_movie_event.dart';
part 'watchlist_movie_state.dart';

class WatchlistMovieBloc extends Bloc<WatchlistMovieEvent, WatchlistMovieState> {
  final GetWatchlistMovies _getWatchlistMovies;
  final GetWatchListStatus _getWatchListStatus;
  final RemoveWatchlist _removeWatchlist;
  final SaveWatchlist _saveWatchlist;

  WatchlistMovieBloc(
      this._getWatchlistMovies,
      this._getWatchListStatus,
      this._removeWatchlist,
      this._saveWatchlist,
      ) : super(WatchlistMovieEmpty()) {
    on<OnWatchlistMovies>((event, emit) async {
      emit(WatchlistMoviesLoading());
      final result = await _getWatchlistMovies.execute();
      result.fold((failure){
        emit(WatchlistMoviesError(failure.message));
      }, (data) {
        if(data.isEmpty){
          emit(WatchlistMovieEmpty());
        } else {
          emit(WatchlistMoviesHasData(data));
        }
      }
      );
      // TODO: implement event handler
    });
    on<WatchlistMovies>((event, emit) async {
      final id = event.id;

      final result = await _getWatchListStatus.execute(id);

      emit(InsertWatchlist(result));
    });

    on<InsertWatchlistMovies>((event, emit) async {
      emit(WatchlistMoviesLoading());
      final movie = event.movie;

      final result = await _saveWatchlist.execute(movie);

      result.fold(
            (failure) {
          emit(WatchlistMoviesError(failure.message));
        },
            (message) {
          emit(MessageWatchlist(message));
        },
      );
    });

    on<DeleteWatchlistMovies>((event, emit) async {
      final movie = event.movie;

      final result = await _removeWatchlist.execute(movie);

      result.fold(
            (failure) {
          emit(WatchlistMoviesError(failure.message));
        },
            (message) {
          emit(MessageWatchlist(message));
        },
      );
    });
  }
}

