import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/season_tv_series.dart';
import 'package:ditonton/domain/usecases/get_on_the_air_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ditonton/domain/entities/tv_series.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetOnTherAirTVSeries usecase;
  late MockTVSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTVSeriesRepository();
    usecase = GetOnTherAirTVSeries (mockTvSeriesRepository);
  });

  final tSeries = <TVSeries>[];

  test('should get list of tv series from the repository', () async {
    // arrange
    when(mockTvSeriesRepository.getNowPlayingTvSeries())
        .thenAnswer((_) async => Right(tSeries));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tSeries));
  });
}