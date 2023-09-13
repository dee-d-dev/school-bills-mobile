import 'package:json_annotation/json_annotation.dart';

part 'generated/article_model.g.dart';

@JsonSerializable(includeIfNull: false)
class Resolution {
  final String url;
  final int width;
  final int height;
  final String tag;

  Resolution({
    required this.url,
    required this.width,
    required this.height,
    required this.tag,
  });

  factory Resolution.fromJson(Map<String, Object?> json) =>
      _$ResolutionFromJson(json);

  Map<String, dynamic> toJson() => _$ResolutionToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Thumbnail {
  final List<Resolution> resolutions;

  Thumbnail({
    required this.resolutions,
  });

  Resolution get lowRes => resolutions.firstWhere((e) => e.tag != 'original');

  Resolution get highRes => resolutions.firstWhere((e) => e.tag == 'original');

  factory Thumbnail.fromJson(Map<String, Object?> json) =>
      _$ThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.none)
class ArticleModel {
  final String uuid;
  final String title;
  final String publisher;
  final String link;
  final int providerPublishTime;
  final String type;
  final Thumbnail? thumbnail;
  final List<String>? relatedTickers;

  ArticleModel({
    required this.uuid,
    required this.title,
    required this.publisher,
    required this.link,
    required this.providerPublishTime,
    required this.type,
    required this.thumbnail,
    required this.relatedTickers,
  });

  factory ArticleModel.fromJson(Map<String, Object?> json) =>
      _$ArticleModelFromJson(json);
}
