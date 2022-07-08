import 'package:flutter/cupertino.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_series.dart';


class TopRatedTVSeriesNotifier extends ChangeNotifier{
  final GetTopRatedTVSeries getTopRatedTVSeries;

  TopRatedTVSeriesNotifier({required this.getTopRatedTVSeries});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

List<TVSeries> get movies => _series;
  List<TVSeries> _series = [];

  String get message => _message;
  String _message = '';
  

  Future<void> fetchTopRatedTVSeries() async{
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTVSeries.execute();

    result.fold(
          (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
          (seriesData) {
        _state = RequestState.Loaded;
        _series = seriesData;
        notifyListeners();
      },
    );
  }
}