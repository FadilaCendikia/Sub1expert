import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late DeleteTVSeriesFromWatchlist usecase;
  late MockTVSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTVSeriesRepository();
    usecase = DeleteTVSeriesFromWatchlist(mockTvSeriesRepository);
  });

  test('should remove watchlist tv series from repository', () async {
    // arrange
    when(mockTvSeriesRepository.removeTvSeriesWatchlist(testTVSeriesDetail))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = await usecase.execute(testTVSeriesDetail);
    // assert
    verify(mockTvSeriesRepository.removeTvSeriesWatchlist(testTVSeriesDetail));
    expect(result, Right('Removed from watchlist'));
  });
}