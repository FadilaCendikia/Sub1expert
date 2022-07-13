import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:equatable/equatable.dart';

class TvSeriesTable extends Equatable {
  final int id;
  final String? overview;
  final String? posterPath;
  final String? name;

  TvSeriesTable({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.name,
  });

  factory TvSeriesTable.fromEntity(TvSeriesDetail tvSeries) => TvSeriesTable(
        id: tvSeries.id,
        overview: tvSeries.overview,
        posterPath: tvSeries.posterPath,
        name: tvSeries.name,
      );

  factory TvSeriesTable.fromMap(Map<String, dynamic> map) => TvSeriesTable(
        id: map['id'],
        overview: map['overview'],
        posterPath: map['posterPath'],
        name: map['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'overview': overview,
        'posterPath': posterPath,
        'name': name,
      };

  TvSeries toEntity() => TvSeries.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        name: name,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [id, posterPath, overview, name];
}
