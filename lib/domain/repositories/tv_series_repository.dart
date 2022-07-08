import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';

abstract class TVSeriesRepository{
  Future<Either<Failure, List<TVSeries>>> getPopularTVSeries();
  Future<Either<Failure, List<TVSeries>>> getOnTheAirTVSeries();
  Future<Either<Failure, List<TVSeries>>> getTopRatedTVSeries();
  Future<bool> tvSeriesIsAddedToWatchlist(int id);
  Future<Either<Failure, TVSeriesDetail>> getTVSeriesDetail(int id);
  Future<Either<Failure, List<TVSeries>>> searchTVSeries(String query);
  Future<Either<Failure, List<TVSeries>>> getTVSeriesRecommendations(int id);
  Future<Either<Failure, String>> saveTVSeriesWatchlist(TVSeriesDetail series);
  Future<Either<Failure, String>> deleteTVSeriesWatchlist(TVSeriesDetail series);
  Future<Either<Failure, List<TVSeries>>> getWatchlistTVSeries();
}