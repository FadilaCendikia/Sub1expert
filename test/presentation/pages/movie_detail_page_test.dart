import 'package:ditonton/presentation/bloc_movies/bloc/detail_movies_bloc.dart';
import 'package:ditonton/presentation/bloc_movies/bloc/recomendation_movies_bloc.dart';
import 'package:ditonton/presentation/bloc_movies/bloc/watchlist_movies_bloc.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects_movie.dart';
import '../../helpers/movie_helper.dart';

void main() {
  late FakeDetailMovieBloc fakeDetailMovieBloc;
  late FakeMovieRecommendationsBloc fakeMovieRecommendationsBloc;
  late FakeWatchlistMovieBloc fakeWatchlistMovieBloc;

  setUp(() {
    registerFallbackValue(FakeMovieDetailEvent());
    registerFallbackValue(FakeMovieDetailState());
    fakeDetailMovieBloc = FakeDetailMovieBloc();

    registerFallbackValue(FakeMovieRecommendationsEvent());
    registerFallbackValue(FakeMovieRecommendationsState());
    fakeMovieRecommendationsBloc = FakeMovieRecommendationsBloc();

    registerFallbackValue(FakeWatchlistMoviesEvent());
    registerFallbackValue(FakeWatchlistMoviesState());
    fakeWatchlistMovieBloc = FakeWatchlistMovieBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailMoviesBloc>(
          create: (_) => fakeDetailMovieBloc,
        ),
        BlocProvider<WatchlistMoviesBloc>(
          create: (_) => fakeWatchlistMovieBloc,
        ),
        BlocProvider<RecomendationMoviesBloc>(
          create: (_) => fakeMovieRecommendationsBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  tearDown(() {
    fakeDetailMovieBloc.close();
    fakeWatchlistMovieBloc.close();
    fakeMovieRecommendationsBloc.close();
  });

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => fakeDetailMovieBloc.state).thenReturn(DetailMoviesLoading());
    when(() => fakeMovieRecommendationsBloc.state)
        .thenReturn(RecomendationMoviesLoading());
    when(() => fakeWatchlistMovieBloc.state)
        .thenReturn(WatchlistMoviesLoading());

    final viewProgress = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(viewProgress, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(() => fakeDetailMovieBloc.state).thenReturn(DetailMoviesLoading());
    when(() => fakeMovieRecommendationsBloc.state)
        .thenReturn(RecomendationMoviesLoading());
    when(() => fakeWatchlistMovieBloc.state)
        .thenReturn(WatchlistMoviesLoading());

    final viewProgress = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(viewProgress, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(() => fakeDetailMovieBloc.state)
        .thenReturn(DetailMoviesHasData(testMovieDetail));

    when(() => fakeMovieRecommendationsBloc.state)
        .thenReturn(RecomendationMoviesHasData(testMovieList));

    when(() => fakeWatchlistMovieBloc.state).thenReturn(InsertWatchlist(false));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect((watchlistButton), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(() => fakeDetailMovieBloc.state)
        .thenReturn(DetailMoviesHasData(testMovieDetail));
    when(() => fakeMovieRecommendationsBloc.state)
        .thenReturn(RecomendationMoviesHasData(testMovieList));
    when(() => fakeWatchlistMovieBloc.state).thenReturn(InsertWatchlist(false));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect((watchlistButton), findsOneWidget);
  });
}
