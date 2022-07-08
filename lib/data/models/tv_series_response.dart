import 'package:ditonton/data/models/tv_series_model.dart';
import 'package:equatable/equatable.dart';

class TVSeriesResponse extends Equatable{
  final List<TVSeriesModel> TVSeriesList;
  TVSeriesResponse({required this.TVSeriesList});

  factory TVSeriesResponse.fromJson(Map<String,dynamic> json) =>
      TVSeriesResponse(
        TVSeriesList: List<TVSeriesModel>.from((json["results"] as List)
            .map((x) => TVSeriesModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );
  Map<String,dynamic> toJson() =>{
    "results": List<dynamic>.from(TVSeriesList.map((e) => e.toJson())),
  };

  @override
  List<Object> get props => [TVSeriesList];

}