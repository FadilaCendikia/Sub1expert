part of 'search_tv_series_bloc.dart';

@immutable
abstract class SearchTVSeriesEvent extends Equatable{
  const SearchTVSeriesEvent();
}
class OnQueryChanged extends SearchTVSeriesEvent{
  final String query;

  OnQueryChanged(this.query);
  @override
  List<Object> get props => [query];
}
