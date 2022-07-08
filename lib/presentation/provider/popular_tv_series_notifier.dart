import 'package:flutter/cupertino.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_series.dart';


class PopularTVSeriesNotifier extends ChangeNotifier {
  final GetPopularTVSeries getPopularTVSeries;
  PopularTVSeriesNotifier(this.getPopularTVSeries);

  List<TVSeries> get series => _tvSeries;
  List<TVSeries> _tvSeries = [];

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  String get message => _message;
  String _message = '';

  Future<void> fetchPopularTVSeries() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTVSeries.execute();

    result.fold(
          (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
          (seriesData) {
        _tvSeries = seriesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
