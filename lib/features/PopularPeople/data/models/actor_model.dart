import 'package:injectable/injectable.dart';
import 'package:task/core/utils/constants.dart';


@injectable
class ActorModel {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  List<KnownFor>? knownFor;

  ActorModel({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.knownFor,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: double.parse((json['popularity'] as num).toString()),
      profilePath: json['profile_path'] == null ? null : Constants.imagesUrl+json['profile_path'],
      knownFor: json['known_for'] != null ? (json['known_for'] as List).map((e) => KnownFor.fromJson(e)).toList() : [],
    );
  }

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'gender': gender,
    'id': id,
    'known_for_department': knownForDepartment,
    'name': name,
    'original_name': originalName,
    'popularity': popularity,
    'profile_path': profilePath,
    'known_for': knownFor?.map((e) => e.toJson()).toList(),
  };
}

class KnownFor {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  String? originalLanguage;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;

  KnownFor({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
    adult: json['adult'],
    backdropPath: json['backdrop_path'],
    id: json['id'],
    title: json['title'],
    originalTitle: json['original_title'],
    overview: json['overview'],
    posterPath: json['poster_path'],
    mediaType: json['media_type'],
    originalLanguage: json['original_language'],
    genreIds: List<int>.from(json['genre_ids']),
    popularity: (json['popularity'] as num).toDouble(),
    releaseDate: json['release_date'],
    video: json['video'],
    voteAverage: (json['vote_average'] as num).toDouble(),
    voteCount: json['vote_count'],
  );

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'id': id,
    'title': title,
    'original_title': originalTitle,
    'overview': overview,
    'poster_path': posterPath,
    'media_type': mediaType,
    'original_language': originalLanguage,
    'genre_ids': genreIds,
    'popularity': popularity,
    'release_date': releaseDate,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };
}