import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_airing_today_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'airing_today_tv_series_event.dart';
part 'airing_today_tv_series_state.dart';

class AiringTodayTvSeriesBloc
    extends Bloc<AiringTodayTvSeriesEvent, AiringTodayTvSeriesState> {
  final GetAiringTodayTvSeries _getAiringTodayTvSeries;

  AiringTodayTvSeriesBloc(this._getAiringTodayTvSeries)
      : super(AiringTodayTvSeriesEmpty()) {
    on<OnAiringTodayTvSeriesShow>((event, emit) async {
      emit(AiringTodayTvSeriesLoading());
      final result = await _getAiringTodayTvSeries.execute();

      result.fold(
        (failure) {
          emit(AiringTodayTvSeriesError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(AiringTodayTvSeriesEmpty());
          } else {
            emit(AiringTodayTvSeriesHasData(data));
          }
        },
      );
    });
  }
}
