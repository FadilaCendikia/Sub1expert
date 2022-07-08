import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series.dart';
import 'package:ditonton/presentation/provider/tv_series_watchlist_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_tv_series_notifier_test.mocks.dart';

@GenerateMocks([GetWatchListTVSeries])
void main() {
  late WatchlistTVSeriesNotifier provider;
  late MockGetWatchlistTvSeries mockGetWatchlistTvSeries;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetWatchlistTvSeries = MockGetWatchListTVSeries();
    provider = WatchlistTVSeriesNotifier(
      getWatchlistTVSeries: mockGetWatchlistTvSeries,
    )..addListener(() {
      listenerCallCount += 1;
    });
  });

  test('should change tv series data when data is gotten successfully',
          () async {
        // arrange
        when(mockGetWatchlistTvSeries.execute())
            .thenAnswer((_) async => Right([testWatchlistTVSeries]));
        // act
        await provider.fetchWatchlistTVSeries();
        // assert
        expect(provider.watchlistState, RequestState.Loaded);
        expect(provider.watchlistTVSeries, [testWatchlistTVSeries]);
        expect(listenerCallCount, 2);
      });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetWatchlistTvSeries.execute())
        .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
    // act
    await provider.fetchWatchlistTVSeries();
    // assert
    expect(provider.watchlistState, RequestState.Error);
    expect(provider.message, "Can't get data");
    expect(listenerCallCount, 2);
  });
}