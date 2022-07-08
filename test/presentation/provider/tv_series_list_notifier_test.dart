import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_on_the_air_tv_series.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_series.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_series.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_series_list_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_series_list_notifier_test.mocks.dart';

@GenerateMocks([GetOnTherAirTVSeries, GetPopularTVSeries, GetTopRatedTVSeries])
void main() {
  late TVSeriesListNotifier provider;
  late MockGetOnTherAirTVSeries mockGetOnTheAirTVSeries;
  late MockGetPopularTVSeries mockGetPopularTVSeries;
  late MockGetTopRatedTVSeries mockGetTopRatedTvSeries;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetOnTheAirTVSeries = MockGetOnTherAirTVSeries();
    mockGetPopularTVSeries = MockGetPopularTVSeries();
    mockGetTopRatedTvSeries = MockGetTopRatedTVSeries();
    provider = TVSeriesListNotifier(
      getOnTheAirTVSeries: mockGetOnTheAirTVSeries,
      getPopularTVSeries: mockGetPopularTVSeries,
      getTopRatedTVSeries: mockGetTopRatedTvSeries,
    )..addListener(() {
      listenerCallCount += 1;
    });
  });

  final tSeries = TVSeries(
    backdropPath: "/4g5gK5eGWZg8swIZl6eX2AoJp8S.jpg",
    firstAirDate: "2003-10-21",
    genreIds: [18],
    id: 11250,
    name: "Hidden Passion",
    originCountry: ["CO"],
    originalLanguage: "es",
    originalName: "Pasión de gavilanes",
    overview:
    "The Reyes-Elizondo's idyllic lives are shattered by a murder charge against Eric and León.",
    popularity: 1747.047,
    posterPath: "/lWlsZIsrGVWHtBeoOeLxIKDd9uy.jpg",
    voteAverage: 7.6,
    voteCount: 1803,
  );

  final tSeriesList = <TVSeries>[tSeries];

  group('on the air tv series', () {
    test('initialState should be Empty', () {
      expect(provider.onTheAirState, equals(RequestState.Empty));
    });

    test('should get data from the usecase', () async {
      // arrange
      when(mockGetOnTheAirTVSeries.execute())
          .thenAnswer((_) async => Right(tSeriesList));
      // act
      provider.fetchNowPlayingMovies();
      // assert
      verify(mockGetOnTheAirTVSeries.execute());
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      when(mockGetOnTheAirTVSeries.execute())
          .thenAnswer((_) async => Right(tSeriesList));
      // act
      provider.fetchNowPlayingMovies();
      // assert
      expect(provider.onTheAirState, RequestState.Loading);
    });

    test('should change tv series when data is gotten successfully', () async {
      // arrange
      when(mockGetOnTheAirTVSeries.execute())
          .thenAnswer((_) async => Right(tSeriesList));
      // act
      await provider.fetchNowPlayingMovies();
      // assert
      expect(provider.onTheAirState, RequestState.Loaded);
      expect(provider.onTheAirTVSeries, tSeriesList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetOnTheAirTVSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchNowPlayingMovies();
      // assert
      expect(provider.onTheAirState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('popular tv serires', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularTVSeries.execute())
          .thenAnswer((_) async => Right(tSeriesList));
      // act
      provider.fetchPopularTVSeries();
      // assert
      expect(provider.popularTVSeriesState, RequestState.Loading);
      // verify(provider.setState(RequestState.Loading));
    });

    test('should change tv series data when data is gotten successfully',
            () async {
          // arrange
          when(mockGetPopularTVSeries.execute())
              .thenAnswer((_) async => Right(tSeriesList));
          // act
          await provider.fetchPopularTVSeries();
          // assert
          expect(provider.popularTVSeriesState, RequestState.Loaded);
          expect(provider.popularTVSeries, tSeriesList);
          expect(listenerCallCount, 2);
        });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularTVSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchPopularTVSeries();
      // assert
      expect(provider.popularTVSeriesState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('top rated tv series', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Right(tSeriesList));
      // act
      provider.fetchTopRatedMovies();
      // assert
      expect(provider.topRatedTVSeriesState, RequestState.Loading);
    });

    test('should change tv series data when data is gotten successfully',
            () async {
          // arrange
          when(mockGetTopRatedTvSeries.execute())
              .thenAnswer((_) async => Right(tSeriesList));
          // act
          await provider.fetchTopRatedMovies();
          // assert
          expect(provider.topRatedTVSeriesState, RequestState.Loaded);
          expect(provider.topRatedTvSeries, tSeriesList);
          expect(listenerCallCount, 2);
        });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTopRatedMovies();
      // assert
      expect(provider.topRatedTVSeriesState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}