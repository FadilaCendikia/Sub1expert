import 'package:equatable/equatable.dart';

class TVSeries extends Equatable{
  int id;
  int? voteCount;
  String? name;
  String? overview;
  String? posterPath;
  String? backdropPath;
  String? firstAirDate;
  String? originalName;
  String? originalLanguage;
  double? popularity;
  double? voteAverage;
  List<int>? genreIds;
  List<String>? originCountry;

  TVSeries({
    required this.id,
    required this.voteCount,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.firstAirDate,
    required this.originalName,
    required this.originalLanguage,
    required this.voteAverage,
    required this.genreIds,
    required this.originCountry,
    required this.popularity,
  });

  @override
  List<Object?> get props =>[
    id,
    voteCount,
    name,
    overview,
    posterPath,
    backdropPath,
    firstAirDate,
    originalName,
    originalLanguage,
    voteAverage,
    genreIds,
    originCountry,
    popularity,
  ];

  TVSeries.watchlist({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
  });

}