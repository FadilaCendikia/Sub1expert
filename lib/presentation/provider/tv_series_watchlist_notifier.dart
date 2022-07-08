import 'package:flutter/cupertino.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv_series.dart';


class WatchlistTVSeriesNotifier extends ChangeNotifier {
  
  RequestState get watchlistState => _watchlistState;
  List<TVSeries> get watchlistTVSeries => _watchlistTVSeries;

  var _watchlistState = RequestState.Empty;
  var _watchlistTVSeries = <TVSeries>[];
  
  String _message = '';
  String get message => _message;

  WatchlistTVSeriesNotifier({required this.getWatchlistTVSeries});
  final GetWatchListTVSeries getWatchlistTVSeries;

  Future<void> fetchWatchlistTVSeries() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTVSeries.execute();
    result.fold(
          (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
          (data) {
        _watchlistState = RequestState.Loaded;
        _watchlistTVSeries = data;
        notifyListeners();
      },
    );
  }
}
