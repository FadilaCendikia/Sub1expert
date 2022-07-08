import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/widgets/tv_series_card_list.dart';
import 'package:ditonton/presentation/provider/popular_tv_series_notifier.dart';

class PopularTVSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tvseries';

  @override
  State<PopularTVSeriesPage> createState() => _PopularTVSeriesPageState();
}
class _PopularTVSeriesPageState extends State<PopularTVSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<PopularTVSeriesNotifier>(context, listen: false)
            .fetchPopularTVSeries());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular TvSeries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<PopularTVSeriesNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final series = data.series[index];
                  return TVSeriesCard(series);
                },
                itemCount: data.series.length,
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
}
