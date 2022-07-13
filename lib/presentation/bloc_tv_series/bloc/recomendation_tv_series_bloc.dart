import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:equatable/equatable.dart';

part 'recomendation_tv_series_event.dart';
part 'recomendation_tv_series_state.dart';

class RecomendationTvSeriesBloc
    extends Bloc<RecomendationTvSeriesEvent, RecomendationTvSeriesState> {
  final GetTvSeriesRecommendations _getTvSeriesRecommendations;

  RecomendationTvSeriesBloc(this._getTvSeriesRecommendations)
      : super(RecomendationTvSeriesEmpty()) {
    on<OnRecomendationTvSeriesShow>((event, emit) async {
      final id = event.id;

      emit(RecomendationTvSeriesLoading());
      final result = await _getTvSeriesRecommendations.execute(id);

      result.fold(
        (failure) {
          emit(RecomendationTvSeriesError(failure.message));
        },
        (data) {
          emit(RecomendationTvSeriesHasData(data));
        },
      );
    });
  }
}
