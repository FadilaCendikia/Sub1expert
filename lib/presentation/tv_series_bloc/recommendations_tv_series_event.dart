part of 'recommendations_tv_series_bloc.dart';

@immutable
abstract class RecommendationsTVSeriesEvent extends Equatable{
  const RecommendationsTVSeriesEvent();

}
class OnRecommendationTVSeriesShow extends RecommendationsTVSeriesEvent{
  final int id;
  OnRecommendationTVSeriesShow(this.id);
  @override
  List<Object> get props => [];
}

