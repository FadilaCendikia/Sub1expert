part of 'detail_tv_series_bloc.dart';

@immutable
abstract class DetailTVSeriesEvent extends Equatable{
  const DetailTVSeriesEvent();


}
class OnDetailTVSeriesShow extends DetailTVSeriesEvent{
  final int id;

  OnDetailTVSeriesShow(this.id);

  @override
  List<Object> get props => [];
}
