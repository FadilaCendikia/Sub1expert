import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/tv_series_table.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';


abstract class TVSeriesLocalDataSource {
  Future<String> insertTVSeriesWatchlist(TVSeriesTable series);
  Future<String> deleteTVSeriesWatchlist(TVSeriesTable series);
  Future<TVSeriesTable?> getTVSeriesById(int id);
  Future<List<TVSeriesTable>> getWatchlistTVSeries();
}

class TVSeriesLocalDataSourceImpl implements TVSeriesLocalDataSource {
  final DatabaseHelper databaseHelper;

  TVSeriesLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<TVSeriesTable?> getTVSeriesById(int id) async {
    final result = await databaseHelper.getTVSeriesById(id);
    if (result != null) {
      return TVSeriesTable.fromMap(result);
    } else{
      return null;
    }
  }
  @override
  Future<List<TVSeriesTable>> getWatchlistTVSeries() async{
    final result = await databaseHelper.getWatchlistTVSeries();
    return result.map((data) => TVSeriesTable.fromMap(data)).toList();
  }

  @override
  Future<String> insertTVSeriesWatchlist(TVSeriesTable series) async {
    try {
      await databaseHelper.insertTVSeriesWatchlist(series);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
 @override
  Future<String> deleteTVSeriesWatchlist(TVSeriesTable series) async {
    try {
      await databaseHelper.deleteTVSeriesWatchlist(series);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
