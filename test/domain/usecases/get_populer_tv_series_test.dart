import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTVSeries usecase;
  late MockTVSeriesRepository mockTvSeriesRpository;

  setUp(() {
    mockTvSeriesRpository = MockTVSeriesRepository();
    usecase = GetPopularTVSeries (mockTvSeriesRpository);
  });

  final tSeries = <TVSeries>[];

  group('GetPopularMovies Tests', () {
    group('execute', () {
      test(
          'should get list of tv series from the repository when execute function is called',
              () async {
            // arrange
            when(mockTvSeriesRpository.getPopularTv())
                .thenAnswer((_) async => Right(tSeries));
            // act
            final result = await usecase.execute();
            // assert
            expect(result, Right(tSeries));
          });
    });
  });
}