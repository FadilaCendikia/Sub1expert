
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/search_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchTVSeries usecase;
  late MockTVSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTVSeriesRepository();
    usecase = SearchTVSeries(mockTvSeriesRepository);
  });

  final tSeries = <TVSeries>[];
  final tQuery = 'Halo';

  test('should get list of tv series from the repository', () async {
    // arrange
    when(mockTvSeriesRepository.searchTVSeries(tQuery))
        .thenAnswer((_) async => Right(tSeries));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tSeries));
  });
}

mixin MockTVSeriesRepository {
}