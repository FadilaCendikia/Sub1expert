import 'package:flutter/cupertino.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_series.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_series.dart';
import 'package:ditonton/domain/usecases/get_on_the_air_tv_series.dart';


class TVSeriesListNotifier extends ChangeNotifier {
  var _onTheAirTVSeries = <TVSeries>[];
  List<TVSeries> get onTheAirTVSeries => _onTheAirTVSeries;


  RequestState _popularTVSeriesState = RequestState.Empty;
  RequestState get popularTVSeriesState => _popularTVSeriesState;
  RequestState _onTheAirTVSeriesState = RequestState.Empty;
  RequestState get onTheAirState => _onTheAirTVSeriesState;
  RequestState _topRatedTVSeriesState = RequestState.Empty;
  RequestState get topRatedTVSeriesState => _topRatedTVSeriesState;

final GetOnTherAirTVSeries getOnTheAirTVSeries;
  final GetPopularTVSeries getPopularTVSeries;
  final GetTopRatedTVSeries getTopRatedTVSeries;

  var _topRatedTVSeries = <TVSeries>[];
  List<TVSeries> get topRatedTvSeries => _topRatedTVSeries;
  var _popularTVSeries = <TVSeries>[];
  List<TVSeries> get popularTVSeries => _popularTVSeries;

  String get message => _message;
  String _message = '';
  TVSeriesListNotifier({
    required this.getOnTheAirTVSeries,
    required this.getTopRatedTVSeries,
    required this.getPopularTVSeries,
  });

  Future<void> fetchPopularTVSeries() async {
    _popularTVSeriesState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTVSeries.execute();
    result.fold(
          (failure) {
        _popularTVSeriesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
          (tvData) {
        _popularTVSeriesState = RequestState.Loaded;
        _popularTVSeries = tvData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedMovies() async {
    _topRatedTVSeriesState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTVSeries.execute();
    result.fold(
          (failure) {
        _topRatedTVSeriesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
          (seriesData) {
        _topRatedTVSeriesState = RequestState.Loaded;
        _topRatedTVSeries = seriesData;
        notifyListeners();
      },
    );
  }
  Future<void> fetchNowPlayingMovies() async {
    _onTheAirTVSeriesState = RequestState.Loading;
    notifyListeners();

    final result = await getOnTheAirTVSeries.execute();
    result.fold(
          (failure) {
        _onTheAirTVSeriesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
          (moviesData) {
        _onTheAirTVSeriesState = RequestState.Loaded;
        _onTheAirTVSeries = moviesData;
        notifyListeners();
      },
    );
  }
}