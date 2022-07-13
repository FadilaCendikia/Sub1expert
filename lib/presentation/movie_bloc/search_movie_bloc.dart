import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies _searhMovie;
  SearchMovieBloc(this._searhMovie) : super(SearchMovieEmpty()) {
    EventTransformer<T> debounce<T>(Duration duration){
      return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
    }
    on<OnQueryChanged>((event, emit) async{
      final query = event.query;
      emit(SearchMoviesLoading());
      final result = await _searhMovie.execute(query);
      result.fold((failure){
        emit(SearchMoviesError(failure.message));
      }, (data){
        emit(SearchMoviesHasData(data));
      });
      // TODO: implement event handler
    });
  }
}
