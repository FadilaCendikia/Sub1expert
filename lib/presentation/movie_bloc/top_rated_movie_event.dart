part of 'top_rated_movie_bloc.dart';

@immutable
abstract class TopRatedMovieEvent  extends Equatable{
  const TopRatedMovieEvent();
}
class OnTopRatedMovieShow extends TopRatedMovieEvent{
  @override
  List<Object?> get props=> [];
}
