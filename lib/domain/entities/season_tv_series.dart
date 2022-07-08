import 'package:equatable/equatable.dart';

class Season extends Equatable {
  int id;
   int episodeCount;
  int seasonNumber;
  String name;
  String posterPath;

  Season({
        required this.id,
        required this.episodeCount,
        required this.seasonNumber,
        required this.name,
        required this.posterPath,
        });

  @override
  List<Object?> get props => [
    id,
    episodeCount,
    seasonNumber,
    name,
    posterPath,
  ];
}
