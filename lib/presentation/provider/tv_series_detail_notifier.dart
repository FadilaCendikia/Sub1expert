import 'package:flutter/cupertino.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/save_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series_status.dart';


class TVSeriesDetailNotifier extends ChangeNotifier {
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';
  static const watchlistAddSuccessMessage = 'Added to Watchlist';

  final GetTVSeriesDetail getTVSeriesDetail;
  final SaveTVSeriesFromWatchlist saveTVSeriesFromWatchList;
  final GetTVSeriesWatchListStatus getTVSeriesWatchListStatus;
  final GetTVSeriesRecommendations getTVSeriesRecommendations;
  final DeleteTVSeriesFromWatchlist deleteTVSeriesFormWatchlist;

  TVSeriesDetailNotifier({
    required this.getTVSeriesDetail,
    required this.saveTVSeriesFromWatchList,
    required this.getTVSeriesWatchListStatus,
    required this.getTVSeriesRecommendations,
    required this.deleteTVSeriesFormWatchlist});

  late TVSeriesDetail _detail;
  TVSeriesDetail get detail => _detail;

  RequestState _recommendationState = RequestState.Empty;
  RequestState get recommendationState => _recommendationState;
  RequestState get detailState => _detailState;
  RequestState _detailState = RequestState.Empty;

  List<TVSeries> get seriesRecommendations => _seriesRecommendations;
  List<TVSeries> _seriesRecommendations = [];

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;
  String _message = '';
  String get message => _message;

  Future<void> fetchTVSeriesDetail(int id) async {
    _detailState = RequestState.Loading;
    notifyListeners();
    final detailResult = await getTVSeriesDetail.execute(id);
    final recommendationResult = await getTVSeriesRecommendations.execute(id);
    detailResult.fold(
          (failure) {
        _detailState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
          (detail) {
        _recommendationState = RequestState.Loading;
        _detail = detail;
        notifyListeners();
        recommendationResult.fold(
              (failure) {
            _recommendationState = RequestState.Error;
            _message = failure.message;
          },
              (series) {
            _recommendationState = RequestState.Loaded;
            _seriesRecommendations = series;
          },
        );
        _detailState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  bool _isAddedtoWatchlist = false;
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  Future<void> deleteFromWatchlist(TVSeriesDetail detail) async{
    final result = await deleteTVSeriesFormWatchlist.execute(detail);

    await result.fold(
          (failure) async {
        _watchlistMessage = failure.message;
      },
          (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadTVSeriesWatchlistStatus(detail.id);
  }

  Future<void> addTVSeriesWatchlist(TVSeriesDetail series) async {
    final result = await saveTVSeriesFromWatchList.execute(series);

    await result.fold(
          (failure) async {
        _watchlistMessage = failure.message;
      },
          (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );
    await loadTVSeriesWatchlistStatus(series.id);
  }

  Future<void> loadTVSeriesWatchlistStatus(int id) async{
    final result = await getTVSeriesWatchListStatus.execute(id);
    _isAddedtoWatchlist = result;
    print(result);
    notifyListeners();
  }
}
