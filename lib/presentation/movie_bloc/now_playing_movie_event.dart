part of 'now_playing_movie_bloc.dart';

@immutable
abstract class NowPlayingMovieEvent extends Equatable {
  const NowPlayingMovieEvent();
}
class OnNowPlayingMovieShow extends NowPlayingMovieEvent{
  @override
  List<Object?> get props => [];
}

