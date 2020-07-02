import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model extends Object {
  @JsonKey(name: 'rating')
  Rating rating;

  @JsonKey(name: 'reviews_count')
  int reviewsCount;

  @JsonKey(name: 'videos')
  List<Videos> videos;

  @JsonKey(name: 'wish_count')
  int wishCount;

  @JsonKey(name: 'original_title')
  String originalTitle;

  @JsonKey(name: 'blooper_urls')
  List<String> blooperUrls;

  @JsonKey(name: 'collect_count')
  int collectCount;

  @JsonKey(name: 'images')
  Images images;

  @JsonKey(name: 'douban_site')
  String doubanSite;

  @JsonKey(name: 'year')
  String year;

  @JsonKey(name: 'popular_comments')
  List<Popular_comments> popularComments;

  @JsonKey(name: 'alt')
  String alt;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'mobile_url')
  String mobileUrl;

  @JsonKey(name: 'photos_count')
  int photosCount;

  @JsonKey(name: 'pubdate')
  String pubdate;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'has_video')
  bool hasVideo;

  @JsonKey(name: 'share_url')
  String shareUrl;

  @JsonKey(name: 'languages')
  List<String> languages;

  @JsonKey(name: 'schedule_url')
  String scheduleUrl;

  @JsonKey(name: 'writers')
  List<Writers> writers;

  @JsonKey(name: 'pubdates')
  List<String> pubdates;

  @JsonKey(name: 'website')
  String website;

  @JsonKey(name: 'tags')
  List<String> tags;

  @JsonKey(name: 'has_schedule')
  bool hasSchedule;

  @JsonKey(name: 'durations')
  List<String> durations;

  @JsonKey(name: 'genres')
  List<String> genres;

  @JsonKey(name: 'trailers')
  List<Trailers> trailers;

  @JsonKey(name: 'trailer_urls')
  List<String> trailerUrls;

  @JsonKey(name: 'has_ticket')
  bool hasTicket;

  @JsonKey(name: 'bloopers')
  List<Bloopers> bloopers;

  @JsonKey(name: 'clip_urls')
  List<String> clipUrls;

  @JsonKey(name: 'casts')
  List<Casts> casts;

  @JsonKey(name: 'countries')
  List<String> countries;

  @JsonKey(name: 'mainland_pubdate')
  String mainlandPubdate;

  @JsonKey(name: 'photos')
  List<Photos> photos;

  @JsonKey(name: 'summary')
  String summary;

  @JsonKey(name: 'clips')
  List<Clips> clips;

  @JsonKey(name: 'subtype')
  String subtype;

  @JsonKey(name: 'directors')
  List<Directors> directors;

  @JsonKey(name: 'comments_count')
  int commentsCount;

  @JsonKey(name: 'popular_reviews')
  List<Popular_reviews> popularReviews;

  @JsonKey(name: 'ratings_count')
  int ratingsCount;

  @JsonKey(name: 'aka')
  List<String> aka;

  Model(
    this.rating,
    this.reviewsCount,
    this.videos,
    this.wishCount,
    this.originalTitle,
    this.blooperUrls,
    this.collectCount,
    this.images,
    this.doubanSite,
    this.year,
    this.popularComments,
    this.alt,
    this.id,
    this.mobileUrl,
    this.photosCount,
    this.pubdate,
    this.title,
    this.hasVideo,
    this.shareUrl,
    this.languages,
    this.scheduleUrl,
    this.writers,
    this.pubdates,
    this.website,
    this.tags,
    this.hasSchedule,
    this.durations,
    this.genres,
    this.trailers,
    this.trailerUrls,
    this.hasTicket,
    this.bloopers,
    this.clipUrls,
    this.casts,
    this.countries,
    this.mainlandPubdate,
    this.photos,
    this.summary,
    this.clips,
    this.subtype,
    this.directors,
    this.commentsCount,
    this.popularReviews,
    this.ratingsCount,
    this.aka,
  );

  factory Model.fromJson(Map<String, dynamic> srcJson) =>
      _$ModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
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
  num one;

  @JsonKey(name: '2')
  num two;

  @JsonKey(name: '3')
  num three;

  @JsonKey(name: '4')
  num four;

  @JsonKey(name: '5')
  num five;

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
class Videos extends Object {
  @JsonKey(name: 'source')
  Source source;

  @JsonKey(name: 'sample_link')
  String sampleLink;

  @JsonKey(name: 'video_id')
  String videoId;

  @JsonKey(name: 'need_pay')
  bool needPay;

  Videos(
    this.source,
    this.sampleLink,
    this.videoId,
    this.needPay,
  );

  factory Videos.fromJson(Map<String, dynamic> srcJson) =>
      _$VideosFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideosToJson(this);
}

@JsonSerializable()
class Source extends Object {
  @JsonKey(name: 'literal')
  String literal;

  @JsonKey(name: 'pic')
  String pic;

  @JsonKey(name: 'name')
  String name;

  Source(
    this.literal,
    this.pic,
    this.name,
  );

  factory Source.fromJson(Map<String, dynamic> srcJson) =>
      _$SourceFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
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

@JsonSerializable()
class Popular_comments extends Object {
  @JsonKey(name: 'rating')
  Rating rating;

  @JsonKey(name: 'useful_count')
  int usefulCount;

  @JsonKey(name: 'author')
  Author author;

  @JsonKey(name: 'subject_id')
  String subjectId;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'id')
  String id;

  Popular_comments(
    this.rating,
    this.usefulCount,
    this.author,
    this.subjectId,
    this.content,
    this.createdAt,
    this.id,
  );

  factory Popular_comments.fromJson(Map<String, dynamic> srcJson) =>
      _$Popular_commentsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Popular_commentsToJson(this);
}

@JsonSerializable()
class Author extends Object {
  @JsonKey(name: 'uid')
  String uid;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'signature')
  String signature;

  @JsonKey(name: 'alt')
  String alt;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  Author(
    this.uid,
    this.avatar,
    this.signature,
    this.alt,
    this.id,
    this.name,
  );

  factory Author.fromJson(Map<String, dynamic> srcJson) =>
      _$AuthorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@JsonSerializable()
class Writers extends Object {
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

  Writers(
    this.avatars,
    this.nameEn,
    this.name,
    this.alt,
    this.id,
  );

  factory Writers.fromJson(Map<String, dynamic> srcJson) =>
      _$WritersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WritersToJson(this);
}

@JsonSerializable()
class Trailers extends Object {
  @JsonKey(name: 'medium')
  String medium;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'subject_id')
  String subjectId;

  @JsonKey(name: 'alt')
  String alt;

  @JsonKey(name: 'small')
  String small;

  @JsonKey(name: 'resource_url')
  String resourceUrl;

  @JsonKey(name: 'id')
  String id;

  Trailers(
    this.medium,
    this.title,
    this.subjectId,
    this.alt,
    this.small,
    this.resourceUrl,
    this.id,
  );

  factory Trailers.fromJson(Map<String, dynamic> srcJson) =>
      _$TrailersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TrailersToJson(this);
}

@JsonSerializable()
class Bloopers extends Object {
  @JsonKey(name: 'medium')
  String medium;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'subject_id')
  String subjectId;

  @JsonKey(name: 'alt')
  String alt;

  @JsonKey(name: 'small')
  String small;

  @JsonKey(name: 'resource_url')
  String resourceUrl;

  @JsonKey(name: 'id')
  String id;

  Bloopers(
    this.medium,
    this.title,
    this.subjectId,
    this.alt,
    this.small,
    this.resourceUrl,
    this.id,
  );

  factory Bloopers.fromJson(Map<String, dynamic> srcJson) =>
      _$BloopersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BloopersToJson(this);
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
class Photos extends Object {
  @JsonKey(name: 'thumb')
  String thumb;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'alt')
  String alt;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'icon')
  String icon;

  Photos(
    this.thumb,
    this.image,
    this.cover,
    this.alt,
    this.id,
    this.icon,
  );

  factory Photos.fromJson(Map<String, dynamic> srcJson) =>
      _$PhotosFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PhotosToJson(this);
}

@JsonSerializable()
class Clips extends Object {
  @JsonKey(name: 'medium')
  String medium;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'subject_id')
  String subjectId;

  @JsonKey(name: 'alt')
  String alt;

  @JsonKey(name: 'small')
  String small;

  @JsonKey(name: 'resource_url')
  String resourceUrl;

  @JsonKey(name: 'id')
  String id;

  Clips(
    this.medium,
    this.title,
    this.subjectId,
    this.alt,
    this.small,
    this.resourceUrl,
    this.id,
  );

  factory Clips.fromJson(Map<String, dynamic> srcJson) =>
      _$ClipsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ClipsToJson(this);
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
class Popular_reviews extends Object {
  @JsonKey(name: 'rating')
  Rating rating;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'subject_id')
  String subjectId;

  @JsonKey(name: 'author')
  Author author;

  @JsonKey(name: 'summary')
  String summary;

  @JsonKey(name: 'alt')
  String alt;

  @JsonKey(name: 'id')
  String id;

  Popular_reviews(
    this.rating,
    this.title,
    this.subjectId,
    this.author,
    this.summary,
    this.alt,
    this.id,
  );

  factory Popular_reviews.fromJson(Map<String, dynamic> srcJson) =>
      _$Popular_reviewsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Popular_reviewsToJson(this);
}
