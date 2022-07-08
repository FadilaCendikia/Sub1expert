import 'package:flutter/cupertino.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/search_tv_series.dart';


class TVSeriesSearchNotifier extends ChangeNotifier{
  final SearchTVSeries searchTVSeries;
  TVSeriesSearchNotifier({required this.searchTVSeries});

  List<TVSeries> get searchResult => _searchResult;
  List<TVSeries> _searchResult = [];

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  String get message => _message;
  String _message = '';

  Future<void> fetchTVSeriesSearch(String query) async{
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchTVSeries.execute(query);
    result.fold(
          (failure) {
        _state = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
          (data) {
        _state = RequestState.Loaded;
        _searchResult = data;
        notifyListeners();
      },
    );
  }
}