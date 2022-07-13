import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_tv_series_event.dart';
part 'top_rated_tv_series_state.dart';

class TopRatedTvSeriesBloc
    extends Bloc<TopRatedTvSeriesEvent, TopRatedTvSeriesState> {
  final GetTopRatedTvSeries _getTopRatedTvSeries;

  TopRatedTvSeriesBloc(this._getTopRatedTvSeries)
      : super(TopRatedTvSeriesEmpty()) {
    on<OnTopRatedTvSeriesShow>((event, emit) async {
      emit(TopRatedTvSeriesLoading());
      final result = await _getTopRatedTvSeries.execute();

      result.fold(
        (failure) {
          emit(TopRatedTvSeriesError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(TopRatedTvSeriesEmpty());
          } else {
            emit(TopRatedTvSeriesHasData(data));
          }
        },
      );
    });
  }
}
