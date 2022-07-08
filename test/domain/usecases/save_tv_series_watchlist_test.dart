
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveTVSeriesFromWatchlist usecase;
  late MockTVSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTVSeriesRepository();
    usecase = SaveTVSeriesFromWatchlist(mockTvSeriesRepository);
  });

  test('should save tv series to the repository', () async {
    // arrange
    when(mockTvSeriesRepository.saveTvSeriesWatchlist(testTVSeriesDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testTVSeriesDetail);
    // assert
    verify(mockTvSeriesRepository.saveTvSeriesWatchlist(testTVSeriesDetail));
    expect(result, Right('Added to Watchlist'));
  });
}