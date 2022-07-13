part of 'detail_tv_series_bloc.dart';

abstract class DetailTvSeriesEvent extends Equatable {
  const DetailTvSeriesEvent();
}

class OnDetailTvSeriesShow extends DetailTvSeriesEvent {
  final int id;

  OnDetailTvSeriesShow(this.id);

  @override
  List<Object> get props => [];
}
