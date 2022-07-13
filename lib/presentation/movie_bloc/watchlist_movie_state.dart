part of 'watchlist_movie_bloc.dart';


abstract class WatchlistMovieState extends Equatable{
  const WatchlistMovieState();
  @override
  List<Object> get props => [];
}

class WatchlistMovieEmpty extends WatchlistMovieState {
  @override
  List<Object> get props => [];
}

class WatchlistMoviesLoading extends WatchlistMovieState {
  @override
  List<Object> get props => [];
}

class WatchlistMoviesError extends WatchlistMovieState {
  String message;
  WatchlistMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistMoviesHasData extends WatchlistMovieState {
  final List<Movie> result;

  WatchlistMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}

class InsertWatchlist extends WatchlistMovieState {
  final bool status;

  InsertWatchlist(this.status);

  @override
  List<Object> get props => [status];
}

class MessageWatchlist extends WatchlistMovieState {
  final String message;

  MessageWatchlist(this.message);

  @override
  List<Object> get props => [message];
}
