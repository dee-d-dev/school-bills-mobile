// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resolution _$ResolutionFromJson(Map<String, dynamic> json) => Resolution(
      url: json['url'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      tag: json['tag'] as String,
    );

Map<String, dynamic> _$ResolutionToJson(Resolution instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'tag': instance.tag,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      resolutions: (json['resolutions'] as List<dynamic>)
          .map((e) => Resolution.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'resolutions': instance.resolutions.map((e) => e.toJson()).toList(),
    };

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      publisher: json['publisher'] as String,
      link: json['link'] as String,
      providerPublishTime: json['providerPublishTime'] as int,
      type: json['type'] as String,
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      relatedTickers: (json['relatedTickers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) {
  final val = <String, dynamic>{
    'uuid': instance.uuid,
    'title': instance.title,
    'publisher': instance.publisher,
    'link': instance.link,
    'providerPublishTime': instance.providerPublishTime,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumbnail', instance.thumbnail?.toJson());
  writeNotNull('relatedTickers', instance.relatedTickers);
  return val;
}
