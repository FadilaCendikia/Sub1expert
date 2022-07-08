import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchListTVSeries usecase;
  late MockTVSeriesRepository mockTVSeriesRepository;

  setUp(() {
    mockTVSeriesRepository = MockTVSeriesRepository();
    usecase = GetWatchListTVSeries(mockTVSeriesRepository);
  });

  test('should get tv series watchlist status from repository', () async {
    // arrange
    when(mockTVSeriesRepository.tvSeriesIsAddedToWatchlist(1))
        .thenAnswer((_) async => true);
    // act
    final result = await usecase.execute();
    // assert
    expect(result, true);
  });
}