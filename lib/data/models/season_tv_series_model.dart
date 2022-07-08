import 'package:ditonton/domain/entities/season_tv_series.dart';
import 'package:equatable/equatable.dart';

class SeasonTVSeriesModel extends Equatable {
  int id;
  int episodeCount;
  int seasonNumber;
  String name;
  String posterPath;

  SeasonTVSeriesModel(
      {
        required this.id,
        required this.episodeCount,
        required this.seasonNumber,
        required this.name,
        required this.posterPath,
        });

  factory SeasonTVSeriesModel.fromJson(Map<String, dynamic> json) => SeasonTVSeriesModel(
      id: json["id"],
      episodeCount: json["episode_count"],
      seasonNumber: json["season_number"],
      name: json["name"],
      posterPath: json["poster_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "episode_count": episodeCount,
    "season_number": seasonNumber,
    "name": name,
    "poster_path": posterPath,
  };

  Season toEntity(){
    return Season(
      id: this.id,
      episodeCount: this.episodeCount,
      seasonNumber: this.seasonNumber,
      name: this.name,
      posterPath: this.posterPath,
    );
  }

  @override
  List<Object?> get props => [
    id,
    episodeCount,
    seasonNumber,
    name,
    posterPath,
  ];
}
