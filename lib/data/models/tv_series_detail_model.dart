import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/season_tv_series_model.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:equatable/equatable.dart';

class TVSeriesDetailResponse extends Equatable{
  TVSeriesDetailResponse({
    required this.adult,
    required this.backdropPath,
    required this.episodeRunTime,
    required this.popularity,
    required this.posterPath,
    required this.seasons,
    required this.status,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.originalName,
    required this.overview,
    required this.type,
    required this.voteAverage,
    required this.voteCount});

  bool adult;
  String backdropPath;
  List<int> episodeRunTime;
  double popularity;
  String posterPath;
  List<SeasonTVSeriesModel> seasons;
  String status;
  String name;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<GenreModel> genres;
  String homepage;
  int id;
  String originalName;
  String overview;
  String type;
  double voteAverage;
  int voteCount;

  factory TVSeriesDetailResponse.fromJson(Map<String, dynamic> json) =>
      TVSeriesDetailResponse(
        adult: json["adult"],
        backdropPath: json["backdrop_path"] ?? "Unknown",
        episodeRunTime: List<int>.from(json["episode_run_time"].map((x) => x)),
        genres: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromJson(x))),
        homepage: json["homepage"] ?? '',
        id: json["id"],
        name: json["name"],
        numberOfEpisodes: json["number_of_episodes"] ?? 0,
        numberOfSeasons: json["number_of_seasons"] ?? 0,
        originalName: json["original_name"] ?? 'Unknown',
        overview: json["overview"] ?? '',
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"] ?? 'Unknown',
        seasons: List<SeasonTVSeriesModel>.from(
            json["seasons"].map((x) => SeasonTVSeriesModel.fromJson(x))),
        status: json["status"] ?? 'Unknown',
        type: json["type"] ?? 'Unknown',
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

 TVSeriesDetail toEntity(){
    return TVSeriesDetail(
      adult: this.adult,
      backdropPath: this.backdropPath,
      episodeRunTime: this.episodeRunTime.map((e) => e).toList(),
      genres: this.genres.map((genre) => genre.toEntity()).toList(),
      homepage: this.homepage,
      id: this.id,
      name: this.name,
      numberOfEpisodes: this.numberOfEpisodes,
      numberOfSeasons: this.numberOfSeasons,
      originalName: this.originalName,
      overview: this.overview,
      popularity: this.popularity,
      posterPath: this.posterPath,
      seasons: this.seasons.map((season) => season.toEntity()).toList(),
      status: this.status,
      type: this.type,
      voteAverage: this.voteAverage,
      voteCount: this.voteCount,
    );
  }

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "episode_run_time": List<dynamic>.from(episodeRunTime.map((x) => x)),
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "homepage": homepage,
    "id": id,
    "name": name,
    "number_of_episodes": numberOfEpisodes,
    "number_of_seasons": numberOfSeasons,
    "original_name": originalName,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
    "status": status,
    "type": type,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
  @override

  List<Object?> get props => [
    adult,
    backdropPath,
    episodeRunTime,
    popularity,
    posterPath,
    seasons,
    status,
    name,
    numberOfEpisodes,
    numberOfSeasons,genres,
    homepage,
    id,
    originalName,
    overview,
    type,
    voteAverage,
    voteCount,
  ];
}
