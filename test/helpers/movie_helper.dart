import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc_movies/bloc/detail_movies_bloc.dart';
import 'package:ditonton/presentation/bloc_movies/bloc/now_playing_movies_bloc.dart';
import 'package:ditonton/presentation/bloc_movies/bloc/popular_movies_bloc.dart';
import 'package:ditonton/presentation/bloc_movies/bloc/recomendation_movies_bloc.dart';
import 'package:ditonton/presentation/bloc_movies/bloc/top_rated_movies_bloc.dart';
import 'package:ditonton/presentation/bloc_movies/bloc/watchlist_movies_bloc.dart';
import 'package:mocktail/mocktail.dart';

// Now Playing
class FakeNowPlayingMoviesEvent extends Fake implements NowPlayingMoviesEvent {}

class FakeNowPlayingMoviesState extends Fake implements NowPlayingMoviesState {}

class FakeNowPlayingMoviesBloc
    extends MockBloc<NowPlayingMoviesEvent, NowPlayingMoviesState>
    implements NowPlayingMoviesBloc {}

// Popular
class FakePopularMoviesEvent extends Fake implements PopularMoviesEvent {}

class FakePopularMoviesState extends Fake implements PopularMoviesState {}

class FakePopularMoviesBloc
    extends MockBloc<PopularMoviesEvent, PopularMoviesState>
    implements PopularMoviesBloc {}

// Top Rated
class FakeTopRatedMoviesEvent extends Fake implements TopRatedMoviesEvent {}

class FakeTopRatedMoviesState extends Fake implements TopRatedMoviesState {}

class FakeTopRatedMoviesBloc
    extends MockBloc<TopRatedMoviesEvent, TopRatedMoviesState>
    implements TopRatedMoviesBloc {}

// Detail Movie
class FakeMovieDetailEvent extends Fake implements DetailMoviesEvent {}

class FakeMovieDetailState extends Fake implements DetailMoviesState {}

class FakeDetailMovieBloc extends MockBloc<DetailMoviesEvent, DetailMoviesState>
    implements DetailMoviesBloc {}

// Recomendation
class FakeMovieRecommendationsEvent extends Fake
    implements RecomendationMoviesEvent {}

class FakeMovieRecommendationsState extends Fake
    implements RecomendationMoviesState {}

class FakeMovieRecommendationsBloc
    extends MockBloc<RecomendationMoviesEvent, RecomendationMoviesState>
    implements RecomendationMoviesBloc {}

// Watch List
class FakeWatchlistMoviesEvent extends Fake implements WatchlistMoviesEvent {}

class FakeWatchlistMoviesState extends Fake implements WatchlistMoviesState {}

class FakeWatchlistMovieBloc
    extends MockBloc<WatchlistMoviesEvent, WatchlistMoviesState>
    implements WatchlistMoviesBloc {}
