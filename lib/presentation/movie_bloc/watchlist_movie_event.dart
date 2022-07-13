part of 'watchlist_movie_bloc.dart';


abstract class WatchlistMovieEvent extends Equatable{
  const WatchlistMovieEvent();
}

class OnWatchlistMovies extends WatchlistMovieEvent {
  @override
  List<Object> get props => [];
}

class WatchlistMovies extends WatchlistMovieEvent {
  final int id;

  WatchlistMovies(this.id);

  @override
  List<Object> get props => [id];
}

class InsertWatchlistMovies extends WatchlistMovieEvent {
  final MovieDetail movie;

  InsertWatchlistMovies(this.movie);

  @override
  List<Object> get props => [movie];
}

class DeleteWatchlistMovies extends WatchlistMovieEvent {
  final MovieDetail movie;

  DeleteWatchlistMovies(this.movie);

  @override
  List<Object> get props => [movie];
}