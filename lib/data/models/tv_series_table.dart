import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:equatable/equatable.dart';

class TVSeriesTable extends Equatable{
  final int id;
  final String? name;
  final String? overview;
  final String? posterPath;

  TVSeriesTable({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
  });

 factory TVSeriesTable.fromMap(Map<String,dynamic> map) => TVSeriesTable(
    id: map['id'],
    name: map['name'],
    overview: map['overview'],
    posterPath: map['posterPath'],
  );

  factory TVSeriesTable.fromEntity(TVSeriesDetail seriesTv) => TVSeriesTable(
      id: seriesTv.id,
      name: seriesTv.name,
      overview: seriesTv.overview,
      posterPath: seriesTv.posterPath,
  );

  Map<String, dynamic> toJson() =>{
    'id':id,
    'name': name,
    'overview': overview,
    'posterPath':posterPath,
  };

  TVSeries toEntity() => TVSeries.watchlist(
      id:id,
      name:name,
      overview: overview,
      posterPath: posterPath,
  );

  @override
  List<Object?> get props => [id,name,overview,posterPath];
}