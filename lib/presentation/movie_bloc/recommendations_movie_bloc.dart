import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'recommendations_movie_event.dart';
part 'recommendations_movie_state.dart';

class RecommendationsMovieBloc extends Bloc<RecommendationsMovieEvent, RecommendationsMovieState> {
  final GetMovieRecommendations _getMovieRecommendations;

  RecommendationsMovieBloc(this._getMovieRecommendations) : super(RecommendationsMovieEmpty()) {
    on<OnRecommendationMovieShow>((event, emit) async{
      // TODO: implement event handler
      final id = event.id;
      emit(RecommendationsMovieLoading());
      final result = await _getMovieRecommendations.execute(id);
      result.fold((failure){
        emit(RecommendationsMovieError(failure.message));
      }, (data){
        emit(RecommendationMovieHasData(data));
      });
    });
  }
}
