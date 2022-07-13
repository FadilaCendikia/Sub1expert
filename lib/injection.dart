import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/movie_local_data_source.dart';
import 'package:ditonton/data/datasources/movie_remote_data_source.dart';
import 'package:ditonton/data/datasources/tv_series_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_series_remote_data_source.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/data/repositories/tv_series_repository_impl.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/usecases/delete_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/get_data_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/get_on_the_air_tv_series.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_series.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_series.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:ditonton/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status_tv_series.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/domain/usecases/search_tv_series.dart';
import 'package:ditonton/presentation/movie_bloc/detail_movie_bloc.dart';
import 'package:ditonton/presentation/movie_bloc/now_playing_movie_bloc.dart';
import 'package:ditonton/presentation/movie_bloc/popular_movie_bloc.dart';
import 'package:ditonton/presentation/movie_bloc/recommendations_movie_bloc.dart';
import 'package:ditonton/presentation/movie_bloc/search_movie_bloc.dart';
import 'package:ditonton/presentation/movie_bloc/top_rated_movie_bloc.dart';
import 'package:ditonton/presentation/movie_bloc/watchlist_movie_bloc.dart';
import 'package:ditonton/presentation/tv_series_bloc/airing_today_tv_series_bloc.dart';
import 'package:ditonton/presentation/tv_series_bloc/popular_tv_series_bloc.dart';
import 'package:ditonton/presentation/tv_series_bloc/recommendations_tv_series_bloc.dart';
import 'package:ditonton/presentation/tv_series_bloc/search_tv_series_bloc.dart';
import 'package:ditonton/presentation/tv_series_bloc/detail_tv_series_bloc.dart';
import 'package:ditonton/presentation/tv_series_bloc/top_rated_tv_series_bloc.dart';
import 'package:ditonton/presentation/tv_series_bloc/watchlist_tv_series_bloc.dart';
import 'package:get_it/get_it.dart';
import 'common/ssl_pinning.dart';

final locator = GetIt.instance;

void init() {
  // bloc movie
  locator.registerFactory(() => DetailMovieBloc(locator(),),);
  locator.registerFactory(() => RecommendationsMovieBloc(locator(),),);
  locator.registerFactory(() => SearchMovieBloc(locator(),),);
  locator.registerFactory(() => NowPlayingMovieBloc(locator(),),);
  locator.registerFactory(() => PopularMovieBloc(locator(),),);
  locator.registerFactory(() => TopRatedMovieBloc(locator(),),);
  locator.registerFactory(() => WatchlistMovieBloc(locator(),
      locator(),
      locator(),
      locator(),
     ),
  );
  //bloc tv series
  locator.registerFactory(() => AiringTodayTVSeriesBloc(locator(),),);
  locator.registerFactory(() => DetailTVSeriesBloc(locator(),),);
  locator.registerFactory(() => RecommendarionsTVSeriesBloc(locator(),),);
  locator.registerFactory(() => SearchTVSeriesBloc(locator(),),);
  locator.registerFactory(() => PopularTVSeriesBloc(locator(),),);
  locator.registerFactory(() => TopRatedTVSeriesBloc(locator(),),);
  locator.registerFactory(() => WatchlistTVSeriesBloc(locator(),
    locator(),
    locator(),
    locator(),
    ),
  );
  // use case
  //MOVIE
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  //TVSERIES
  locator.registerLazySingleton(() => GetOnTheAirTVSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTVSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTVSeries(locator()));
  locator.registerLazySingleton(() => GetTVSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTVSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTVSeries(locator()));
  locator.registerLazySingleton(() => GetDataTVSeriesWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveTVSeriesFromWatchlist(locator()));
  locator.registerLazySingleton(() => DeleteTVSeriesFromWatchlist(locator()));
  locator.registerLazySingleton(() => GetDataWatchlistTVSeries(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TVSeriesRepository>(
        () => TVSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
          () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
          () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerLazySingleton<TVSeriesRemoteDataSourceImpl>(
          () => TVSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TVSeriesLocalDataSourceImpl>(
          () => TVSeriesLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => HttpSSLPinning.client);
}

