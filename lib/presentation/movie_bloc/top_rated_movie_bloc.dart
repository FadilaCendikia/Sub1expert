import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final GetTopRatedMovies _getTopRatedMovies;
  TopRatedMovieBloc(this._getTopRatedMovies) : super(TopRatedMovieEmpty()) {
    on<TopRatedMovieEvent>((event, emit) async {

      emit(TopRatedMoviesLoading());
      final result = await _getTopRatedMovies.execute();

      result.fold((failure){
        emit(TopRatedMoviesError(failure.message));
      }, (data){
        if (data.isEmpty){
          emit(TopRatedMovieEmpty());
        } else{
          emit(TopRatedMoviesHasData(data));
        }
      }
      );
      // TODO: implement event handler
    });
  }
}
