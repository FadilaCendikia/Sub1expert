part of 'detail_movie_bloc.dart';

@immutable
abstract class DetailMovieState extends Equatable{
  const DetailMovieState();
  @override
  List<Object> get props => [];
}

class DetailMovieEmpty extends DetailMovieState {
  @override
  List<Object> get props => [];
}
class DetailMovieLoading extends DetailMovieState {
  @override
  List<Object> get props => [];
}
class DetailMovieError extends DetailMovieState {
  String massage;
  DetailMovieError(this.massage);
  @override
  List<Object> get props =>[massage];
}
class DetailMovieHasData extends DetailMovieState {
  final MovieDetail result;
  DetailMovieHasData(this.result);
  @override
  List<Object> get props => [result];

}

