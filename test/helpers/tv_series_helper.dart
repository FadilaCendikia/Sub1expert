import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc_tv_series/bloc/airing_today_tv_series_bloc.dart';
import 'package:ditonton/presentation/bloc_tv_series/bloc/detail_tv_series_bloc.dart';
import 'package:ditonton/presentation/bloc_tv_series/bloc/popular_tv_series_bloc.dart';
import 'package:ditonton/presentation/bloc_tv_series/bloc/recomendation_tv_series_bloc.dart';
import 'package:ditonton/presentation/bloc_tv_series/bloc/top_rated_tv_series_bloc.dart';
import 'package:ditonton/presentation/bloc_tv_series/bloc/watchlist_tv_series_bloc.dart';
import 'package:mocktail/mocktail.dart';

// Airing Today
class FakeOnTheAirNowTVSeriesEvent extends Fake
    implements AiringTodayTvSeriesEvent {}

class FakeOnTheAirNowTVSeriesState extends Fake
    implements AiringTodayTvSeriesState {}

class FakeOnTheAirNowTVSeriesBloc
    extends MockBloc<AiringTodayTvSeriesEvent, AiringTodayTvSeriesState>
    implements AiringTodayTvSeriesBloc {}

// Popular
class FakePopularTVSeriesEvent extends Fake implements PopularTvSeriesEvent {}

class FakePopularTVSeriesState extends Fake implements PopularTvSeriesState {}

class FakePopularTVSeriesBloc
    extends MockBloc<PopularTvSeriesEvent, PopularTvSeriesState>
    implements PopularTvSeriesBloc {}

// Top Rated
class FakeTopRatedTVSeriesEvent extends Fake implements TopRatedTvSeriesEvent {}

class FakeTopRatedTVSeriesState extends Fake implements TopRatedTvSeriesState {}

class FakeTopRatedTVSeriesBloc
    extends MockBloc<TopRatedTvSeriesEvent, TopRatedTvSeriesState>
    implements TopRatedTvSeriesBloc {}

// Detail Tv Series
class FakeTVSeriesDetailEvent extends Fake implements DetailTvSeriesEvent {}

class FakeTVSeriesDetailState extends Fake implements DetailTvSeriesState {}

class FakeDetailTVSeriesBloc
    extends MockBloc<DetailTvSeriesEvent, DetailTvSeriesState>
    implements DetailTvSeriesBloc {}

// Recomendaion
class FakeTVSeriesRecommendationsEvent extends Fake
    implements RecomendationTvSeriesEvent {}

class FakeTVSeriesRecommendationsState extends Fake
    implements RecomendationTvSeriesState {}

class FakeTVSeriesRecommendationsBloc
    extends MockBloc<RecomendationTvSeriesEvent, RecomendationTvSeriesState>
    implements RecomendationTvSeriesBloc {}

// Watch List
class FakeWatchlistTVSeriesEvent extends Fake
    implements WatchlistTvSeriesEvent {}

class FakeWatchlistTVSeriesState extends Fake
    implements WatchlistTvSeriesState {}

class FakeWatchlistTVSeriesBloc
    extends MockBloc<WatchlistTvSeriesEvent, WatchlistTvSeriesState>
    implements WatchlistTvSeriesBloc {}
