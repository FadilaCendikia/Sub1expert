import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_airing_today_tv_series.dart';
import 'package:ditonton/presentation/bloc_tv_series/bloc/airing_today_tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'airing_today_tv_series_bloc_test.mocks.dart';

@GenerateMocks([GetAiringTodayTvSeries])
void main() {
  late AiringTodayTvSeriesBloc airingTodayTvSeriesBloc;
  late MockGetAiringTodayTvSeries mockGetAiringTodayTvSeries;

  setUp(() {
    mockGetAiringTodayTvSeries = MockGetAiringTodayTvSeries();
    airingTodayTvSeriesBloc =
        AiringTodayTvSeriesBloc(mockGetAiringTodayTvSeries);
  });

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

  group('bloc airing today tv series testing', () {
    test('initial state should be empty', () {
      expect(airingTodayTvSeriesBloc.state, AiringTodayTvSeriesEmpty());
    });

    blocTest<AiringTodayTvSeriesBloc, AiringTodayTvSeriesState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetAiringTodayTvSeries.execute())
            .thenAnswer((_) async => Right(tTvSeriesList));
        return airingTodayTvSeriesBloc;
      },
      act: (bloc) => bloc.add(OnAiringTodayTvSeriesShow()),
      expect: () => [
        AiringTodayTvSeriesLoading(),
        AiringTodayTvSeriesHasData(tTvSeriesList),
      ],
      verify: (bloc) {
        verify(mockGetAiringTodayTvSeries.execute());
        return OnAiringTodayTvSeriesShow().props;
      },
    );

    blocTest<AiringTodayTvSeriesBloc, AiringTodayTvSeriesState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetAiringTodayTvSeries.execute())
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return airingTodayTvSeriesBloc;
      },
      act: (bloc) => bloc.add(OnAiringTodayTvSeriesShow()),
      expect: () => [
        AiringTodayTvSeriesLoading(),
        AiringTodayTvSeriesError('Server Failure'),
      ],
      verify: (bloc) => AiringTodayTvSeriesLoading(),
    );
  });
}
