import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_on_the_air_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'airing_today_tv_series_event.dart';
part 'airing_today_tv_series_state.dart';

class AiringTodayTVSeriesBloc extends Bloc<AiringTodayTvSeriesEvent, AiringTodayTVSeriesState> {
  final GetOnTheAirTVSeries _getOnTheAirTVSeries;
  AiringTodayTVSeriesBloc(this._getOnTheAirTVSeries) : super(AiringTodayTVSeriesEmpty()) {
    on<OnAiringTodayTvSeriesShow>((event, emit) async{
      emit(AiringTodayTVSeriesLoading());
      final result = await _getOnTheAirTVSeries.execute();

      result.fold(
            (failure) {
          emit(AiringTodayTVSeriesError(failure.message));
        },
            (data) {
          if (data.isEmpty) {
            emit(AiringTodayTVSeriesEmpty());
          } else {
            emit(AiringTodayTVSeriesHasData(data));
          }
        },
      );
    });
  }
}

