import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:ditonton/presentation/bloc_tv_series/bloc/recomendation_tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'recomendation_tv_series_bloc_test.mocks.dart';

@GenerateMocks([GetTvSeriesRecommendations])
void main() {
  late RecomendationTvSeriesBloc recomendationTvSeriesBloc;
  late MockGetTvSeriesRecommendations mockGetRecommendationTvSeries;

  setUp(() {
    mockGetRecommendationTvSeries = MockGetTvSeriesRecommendations();
    recomendationTvSeriesBloc =
        RecomendationTvSeriesBloc(mockGetRecommendationTvSeries);
  });

  const tId = 1;

  final tTvSeries = TvSeries(
    backdropPath: "/9hp4JNejY6Ctg9i9ItkM9rd6GE7.jpg",
    firstAirDate: "1997-09-13",
    genreIds: [10764],
    id: 12610,
    name: "Robinson",
    originCountry: ["SE"],
    originalLanguage: "sv",
    originalName: "Robinson",
    overview:
        "Expedition Robinson is a Swedish reality television program in which contestants are put into survival situations, and a voting process eliminates one person each episode until a winner is determined. The format was developed in 1994 by Charlie Parsons for a United Kingdom TV production company called Planet 24, but the Swedish debut in 1997 was the first production to actually make it to television.",
    popularity: 2338.977,
    posterPath: "/sWA0Uo9hkiAtvtjnPvaqfnulIIE.jpg",
    voteAverage: 5,
    voteCount: 3,
  );
  final tTvSeriesList = <TvSeries>[tTvSeries];

  group('bloc recomendation tv series testing', () {
    test('initial state should be empty', () {
      expect(recomendationTvSeriesBloc.state, RecomendationTvSeriesEmpty());
    });

    blocTest<RecomendationTvSeriesBloc, RecomendationTvSeriesState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetRecommendationTvSeries.execute(tId))
            .thenAnswer((_) async => Right(tTvSeriesList));
        return recomendationTvSeriesBloc;
      },
      act: (bloc) => bloc.add(OnRecomendationTvSeriesShow(tId)),
      expect: () => [
        RecomendationTvSeriesLoading(),
        RecomendationTvSeriesHasData(tTvSeriesList),
      ],
      verify: (bloc) {
        verify(mockGetRecommendationTvSeries.execute(tId));
        return OnRecomendationTvSeriesShow(tId).props;
      },
    );

    blocTest<RecomendationTvSeriesBloc, RecomendationTvSeriesState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetRecommendationTvSeries.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return recomendationTvSeriesBloc;
      },
      act: (bloc) => bloc.add(OnRecomendationTvSeriesShow(tId)),
      expect: () => [
        RecomendationTvSeriesLoading(),
        RecomendationTvSeriesError('Server Failure'),
      ],
      verify: (bloc) => RecomendationTvSeriesLoading(),
    );
  });
}
