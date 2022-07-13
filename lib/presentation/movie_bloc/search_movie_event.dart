part of 'search_movie_bloc.dart';

@immutable
abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();
}
class OnQueryChanged extends SearchMovieEvent {
  final String query;

  OnQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}
