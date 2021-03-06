import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model extends Object {
  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'start')
  int start;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'subjects')
  List<Subject> subjects;

  @JsonKey(name: 'title')
  String title;

  Model(
    this.count,
    this.start,
    this.total,
    this.subjects,
    this.title,
  );

  factory Model.fromJson(Map<String, dynamic> srcJson) =>
      _$ModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

@JsonSerializable()
class Subject extends Object {
  @JsonKey(name: 'rating')
  Rating rating;

  @JsonKey(name: 'genres')
  List<String> genres;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'casts')
  List<Casts> casts;

  @JsonKey(name: 'durations')
  List<String> durations;

  @JsonKey(name: 'collect_count')
  int collectCount;

  @JsonKey(name: 'mainland_pubdate')
  String mainlandPubdate;

  @JsonKey(name: 'has_video')
  bool hasVideo;

  @JsonKey(name: 'original_title')
  String originalTitle;

  @JsonKey(name: 'subtype')
  String subtype;

  @JsonKey(name: 'directors')
  List<Directors> directors;

  @JsonKey(name: 'pubdates')
  List<String> pubdates;

  @JsonKey(name: 'year')
  String year;

  @JsonKey(name: 'images')
  Images images;

  @JsonKey(name: 'alt')
  String alt;

  @JsonKey(name: 'id')
  String id;

  Subject(
    this.rating,
    this.genres,
    this.title,
    this.casts,
    this.durations,
    this.collectCount,
    this.mainlandPubdate,
    this.hasVideo,
    this.originalTitle,
    this.subtype,
    this.directors,
    this.pubdates,
    this.year,
    this.images,
    this.alt,
    this.id,
  );

  factory Subject.fromJson(Map<String, dynamic> srcJson) =>
      _$SubjectFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable()
class Rating extends Object {
  @JsonKey(name: 'max')
  int max;

  @JsonKey(name: 'average')
  double average;

  @JsonKey(name: 'details')
  Details details;

  @JsonKey(name: 'stars')
  String stars;

  @JsonKey(name: 'min')
  int min;

  Rating(
    this.max,
    this.average,
    this.details,
    this.stars,
    this.min,
  );

  factory Rating.fromJson(Map<String, dynamic> srcJson) =>
      _$RatingFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
class Details extends Object {
  @JsonKey(name: '1')
  double one;

  @JsonKey(name: '2')
  double two;

  @JsonKey(name: '3')
  double three;

  @JsonKey(name: '4')
  double four;

  @JsonKey(name: '5')
  double five;

  Details(
    this.one,
    this.two,
    this.three,
    this.four,
    this.five,
  );

  factory Details.fromJson(Map<String, dynamic> srcJson) =>
      _$DetailsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}

@JsonSerializable()
class Casts extends Object {
  @JsonKey(name: 'avatars')
  Avatars avatars;

  @JsonKey(name: 'name_en')
  String nameEn;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'alt')
  String alt;

  @JsonKey(name: 'id')
  String id;

  Casts(
    this.avatars,
    this.nameEn,
    this.name,
    this.alt,
    this.id,
  );

  factory Casts.fromJson(Map<String, dynamic> srcJson) =>
      _$CastsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CastsToJson(this);
}

@JsonSerializable()
class Avatars extends Object {
  @JsonKey(name: 'small')
  String small;

  @JsonKey(name: 'large')
  String large;

  @JsonKey(name: 'medium')
  String medium;

  Avatars(
    this.small,
    this.large,
    this.medium,
  );

  factory Avatars.fromJson(Map<String, dynamic> srcJson) =>
      _$AvatarsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AvatarsToJson(this);
}

@JsonSerializable()
class Directors extends Object {
  @JsonKey(name: 'avatars')
  Avatars avatars;

  @JsonKey(name: 'name_en')
  String nameEn;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'alt')
  String alt;

  @JsonKey(name: 'id')
  String id;

  Directors(
    this.avatars,
    this.nameEn,
    this.name,
    this.alt,
    this.id,
  );

  factory Directors.fromJson(Map<String, dynamic> srcJson) =>
      _$DirectorsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DirectorsToJson(this);
}

@JsonSerializable()
class Images extends Object {
  @JsonKey(name: 'small')
  String small;

  @JsonKey(name: 'large')
  String large;

  @JsonKey(name: 'medium')
  String medium;

  Images(
    this.small,
    this.large,
    this.medium,
  );

  factory Images.fromJson(Map<String, dynamic> srcJson) =>
      _$ImagesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}
