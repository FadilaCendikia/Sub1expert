import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv_series.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_series_detail_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetTVSeriesDetail,
  GetTVSeriesRecommendations,
  GetTVSeriesWatchListStatus,
  SaveTVSeriesFromWatchlist,
  DeleteTVSeriesFromWatchlist,
])
void main() {
  late TVSeriesDetailNotifier provider;
  late MockGetTVSeriesDetail mockGetTvSeriesDetail;
  late MockGetTVSeriesRecommendations mockGetTvSeriesRecommendations;
  late MockGetTVSeriesWatchListStatus mockGetTvSeriesWatchlistStatus;
  late MockSaveTVSeriesFromWatchlist mockSaveTvSeriesWatchlist;
  late MockDeleteTVSeriesFromWatchlist mockRemoveTVSeriesWatchlist;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTvSeriesDetail = MockGetTVSeriesDetail();
    mockGetTvSeriesRecommendations = MockGetTVSeriesRecommendations();
    mockGetTvSeriesWatchlistStatus = MockGetTVSeriesWatchListStatus();
    mockSaveTvSeriesWatchlist = MockSaveTVSeriesFromWatchlist();
    mockRemoveTVSeriesWatchlist = MockDeleteTVSeriesFromWatchlist();
    provider = TVSeriesDetailNotifier(
      getTVSeriesDetail: mockGetTvSeriesDetail,
      getTVSeriesRecommendations: mockGetTvSeriesRecommendations,
      getTVSeriesWatchListStatus: mockGetTvSeriesWatchlistStatus,
      saveTVSeriesFromWatchList: mockSaveTvSeriesWatchlist,
      deleteTVSeriesFormWatchlist: mockRemoveTVSeriesWatchlist,
    )..addListener(() {
      listenerCallCount += 1;
    });
  });

  final tId = 1;

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

  void _arrangeUsecase() {
    when(mockGetTvSeriesDetail.execute(tId))
        .thenAnswer((_) async => Right(testTVSeriesDetail));
    when(mockGetTvSeriesRecommendations.execute(tId))
        .thenAnswer((_) async => Right(tSeriesList));
  }

  group('Get Tv Series Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTVSeriesDetail(tId);
      // assert
      verify(mockGetTvSeriesDetail.execute(tId));
      verify(mockGetTvSeriesRecommendations.execute(tId));
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      _arrangeUsecase();
      // act
      provider.fetchTVSeriesDetail(tId);
      // assert
      expect(provider.detailState, RequestState.Loading);
      expect(listenerCallCount, 1);
    });

    test('should change tv series when data is gotten successfully', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTVSeriesDetail(tId);
      // assert
      expect(provider.detailState, RequestState.Loaded);
      expect(provider.detail, testTVSeriesDetail);
      expect(listenerCallCount, 3);
    });

    test('should change recommendation movies when data is gotten successfully',
            () async {
          // arrange
          _arrangeUsecase();
          // act
          await provider.fetchTVSeriesDetail(tId);
          // assert
          expect(provider.detailState, RequestState.Loaded);
          expect(provider.seriesRecommendations, tSeriesList);
        });
  });

  group('Get Tv Series Recommendations', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTVSeriesDetail(tId);
      // assert
      verify(mockGetTvSeriesRecommendations.execute(tId));
      expect(provider.seriesRecommendations, tSeriesList);
    });

    test('should update recommendation state when data is gotten successfully',
            () async {
          // arrange
          _arrangeUsecase();
          // act
          await provider.fetchTVSeriesDetail(tId);
          // assert
          expect(provider.recommendationState, RequestState.Loaded);
          expect(provider.seriesRecommendations, tSeriesList);
        });

    test('should update error message when request in successful', () async {
      // arrange
      when(mockGetTvSeriesDetail.execute(tId))
          .thenAnswer((_) async => Right(testTVSeriesDetail));
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Failed')));
      // act
      await provider.fetchTVSeriesDetail(tId);
      // assert
      expect(provider.recommendationState, RequestState.Error);
      expect(provider.message, 'Failed');
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      // arrange
      when(mockGetTvSeriesWatchlistStatus.execute(1))
          .thenAnswer((_) async => true);
      // act
      await provider.loadTVSeriesWatchlistStatus(1);
      // assert
      expect(provider.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      // arrange
      when(mockSaveTvSeriesWatchlist.execute(testTVSeriesDetail))
          .thenAnswer((_) async => Right('Success'));
      when(mockGetTvSeriesWatchlistStatus.execute(testTVSeriesDetail.id))
          .thenAnswer((_) async => true);
      // act
      await provider.addTVSeriesWatchlist(testTVSeriesDetail);
      // assert
      verify(mockSaveTvSeriesWatchlist.execute(testTVSeriesDetail));
    });

    test('should execute remove watchlist when function called', () async {
      // arrange
      when(mockRemoveTVSeriesWatchlist.execute(testTVSeriesDetail))
          .thenAnswer((_) async => Right('Removed'));
      when(mockGetTvSeriesWatchlistStatus.execute(testTVSeriesDetail.id))
          .thenAnswer((_) async => false);
      // act
      await provider.deleteFromWatchlist(testTVSeriesDetail);
      // assert
      verify(mockRemoveTVSeriesWatchlist.execute(testTVSeriesDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(mockSaveTvSeriesWatchlist.execute(testTVSeriesDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));
      when(mockGetTvSeriesWatchlistStatus.execute(testTVSeriesDetail.id))
          .thenAnswer((_) async => true);
      // act
      await provider.addTVSeriesWatchlist(testTVSeriesDetail);
      // assert
      verify(mockGetTvSeriesWatchlistStatus.execute(testTVSeriesDetail.id));
      expect(provider.isAddedToWatchlist, true);
      expect(provider.watchlistMessage, 'Added to Watchlist');
      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(mockSaveTvSeriesWatchlist.execute(testTVSeriesDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      when(mockGetTvSeriesWatchlistStatus.execute(testTVSeriesDetail.id))
          .thenAnswer((_) async => false);
      // act
      await provider.addTVSeriesWatchlist(testTVSeriesDetail);
      // assert
      expect(provider.watchlistMessage, 'Failed');
      expect(listenerCallCount, 1);
    });
  });

  group('on Error', () {
    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTvSeriesDetail.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Right(tSeriesList));
      // act
      await provider.fetchTVSeriesDetail(tId);
      // assert
      expect(provider.detailState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}