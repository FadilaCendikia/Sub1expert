import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:equatable/equatable.dart';

part 'recomendation_movies_event.dart';
part 'recomendation_movies_state.dart';

class RecomendationMoviesBloc
    extends Bloc<RecomendationMoviesEvent, RecomendationMoviesState> {
  final GetMovieRecommendations _getMovieRecommendations;

  RecomendationMoviesBloc(this._getMovieRecommendations)
      : super(RecomendationMoviesEmpty()) {
    on<OnRecomendationMoviesShow>((event, emit) async {
      final id = event.id;

      emit(RecomendationMoviesLoading());
      final result = await _getMovieRecommendations.execute(id);

      result.fold(
        (failure) {
          emit(RecomendationMoviesError(failure.message));
        },
        (data) {
          emit(RecomendationMoviesHasData(data));
        },
      );
    });
  }
}
