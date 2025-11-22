import 'package:injectable/injectable.dart';
import 'package:task/features/PopularPeople/data/models/actor_model.dart';


@injectable
class ActorResponse {
  int? page;
  List<ActorModel>? results;
  int? totalPages;
  int? totalResults;

  ActorResponse({this.page, this.results, this.totalPages, this.totalResults});

  ActorResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <ActorModel>[];
      json['results'].forEach((v) {
        results!.add(new ActorModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}