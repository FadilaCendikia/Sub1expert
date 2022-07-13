part of 'detail_movie_bloc.dart';

@immutable
abstract class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();
}
class OnDetailMovieShow extends DetailMovieEvent {
  final int id;
  OnDetailMovieShow(this.id);

  @override
  List<Object> get props => [];
}
