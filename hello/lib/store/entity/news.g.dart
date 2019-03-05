// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
      json['body'] as String,
      json['image_source'] as String,
      json['title'] as String,
      json['image'] as String,
      json['share_url'] as String,
      json['js'] as List,
      json['ga_prefix'] as String,
      (json['images'] as List)?.map((e) => e as String)?.toList(),
      json['type'] as int,
      json['id'] as int,
      (json['css'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'body': instance.body,
      'image_source': instance.imageSource,
      'title': instance.title,
      'image': instance.image,
      'share_url': instance.shareUrl,
      'js': instance.js,
      'ga_prefix': instance.gaPrefix,
      'images': instance.images,
      'type': instance.type,
      'id': instance.id,
      'css': instance.css
    };
