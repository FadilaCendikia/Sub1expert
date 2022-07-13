import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'recommendations_tv_series_event.dart';
part 'recommendations_tv_series_state.dart';

class RecommendarionsTVSeriesBloc extends Bloc<RecommendationsTVSeriesEvent, RecommendationsTVSeriesState> {
  final GetTVSeriesRecommendations _getTVSeriesRecommendations;
  RecommendarionsTVSeriesBloc(this._getTVSeriesRecommendations) : super(RecommendationsTVSeriesEmpty()) {
    on<OnRecommendationTVSeriesShow>((event, emit) async {
      final id = event.id;
      emit(RecommendationsTVSeriesLoading());
      final result = await _getTVSeriesRecommendations.execute(id);
      result.fold((failure){
        emit(RecommendationsTVSeriesError(failure.message));
      }, (data){
        emit(RecommendationsTVSeriesHasData(data));
      }
      );
      // TODO: implement event handler
    });
  }
}
