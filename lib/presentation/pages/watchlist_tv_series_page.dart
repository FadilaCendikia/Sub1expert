import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/widgets/tv_series_card_list.dart';
import 'package:ditonton/presentation/provider/tv_series_watchlist_notifier.dart';

class WatchlistTVSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist_tvseries';

  @override
  State<WatchlistTVSeriesPage> createState() => _WatchlistTVSeriesPageState();
}

class _WatchlistTVSeriesPageState extends State<WatchlistTVSeriesPage> with RouteAware{
   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    Provider.of<WatchlistTVSeriesNotifier>(context, listen: false)
        .fetchWatchlistTVSeries();
  }
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<WatchlistTVSeriesNotifier>(context, listen: false)
            .fetchWatchlistTVSeries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Series Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<WatchlistTVSeriesNotifier>(
          builder: (context, data, child) {
            if (data.watchlistState == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.watchlistState == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final series = data.watchlistTVSeries[index];
                  return TVSeriesCard(series);
                },
                itemCount: data.watchlistTVSeries.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
