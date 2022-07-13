import 'package:ditonton/data/models/tv_series_table.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/season.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';

final testTvSeries = TvSeries(
  backdropPath: "/9hp4JNejY6Ctg9i9ItkM9rd6GE7.jpg",
  firstAirDate: "1997-09-13",
  genreIds: [10764],
  id: 12610,
  name: "Robinson",
  originCountry: ["SE"],
  originalLanguage: "sv",
  originalName: "Robinson",
  overview:
      "Expedition Robinson is a Swedish reality television program in which contestants are put into survival situations, and a voting process eliminates one person each episode until a winner is determined. The format was developed in 1994 by Charlie Parsons for a United Kingdom TV production company called Planet 24, but the Swedish debut in 1997 was the first production to actually make it to television.",
  popularity: 2338.977,
  posterPath: "/sWA0Uo9hkiAtvtjnPvaqfnulIIE.jpg",
  voteAverage: 5,
  voteCount: 3,
);

final testTvSeriesList = [testTvSeries];

final testTvSeriesDetail = TvSeriesDetail(
  adult: false,
  backdropPath: "/1uegR4uAxRxiMyX4nQnpzbXhrTw.jpg",
  genres: [
    Genre(id: 10759, name: "Action & Adventure"),
  ],
  id: 92749,
  lastAirDate: "2022-04-27",
  name: "Moon Knight",
  numberOfEpisodes: 6,
  numberOfSeasons: 1,
  originalName: "Moon Knight",
  overview:
      "When Steven Grant, a mild-mannered gift-shop employee, becomes plagued with blackouts and memories of another life, he discovers he has dissociative identity disorder and shares a body with mercenary Marc Spector. As Steven/Marcs enemies converge upon them, they must navigate their complex identities while thrust into a deadly mystery among the powerful gods of Egypt.",
  popularity: 5483.522,
  posterPath: "/x6FsYvt33846IQnDSFxla9j0RX8.jpg",
  seasons: [
    Season(
      airDate: "2022-03-30",
      episodeCount: 6,
      id: 130604,
      name: "Season 1",
      overview: "",
      posterPath: "/11keFudto4QrgrXChukexJwdHPe.jpg",
      seasonNumber: 1,
    ),
  ],
  voteAverage: 8.5,
  voteCount: 507,
);

final testWatchlistTvSeries = TvSeries.watchlist(
  id: 1,
  posterPath: 'posterPath',
  overview: 'overview',
  name: 'name',
);

final testTvSeriesTable = TvSeriesTable(
  id: 1,
  overview: 'overview',
  posterPath: 'posterPath',
  name: 'name',
);

final testTvSeriesMap = {
  'id': 1,
  'posterPath': 'posterPath',
  'overview': 'overview',
  'name': 'name',
};
