import 'package:json_annotation/json_annotation.dart';

part 'news_latest.g.dart';

@JsonSerializable()
class news_latest extends Object {
  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'stories')
  List<Stories> stories;

  @JsonKey(name: 'top_stories')
  List<Top_stories> topStories;

  news_latest(
    this.date,
    this.stories,
    this.topStories,
  );

  factory news_latest.fromJson(Map<String, dynamic> srcJson) =>
      _$news_latestFromJson(srcJson);
}

@JsonSerializable()
class Stories extends Object {
  @JsonKey(name: 'images')
  List<String> images;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'ga_prefix')
  String gaPrefix;

  @JsonKey(name: 'title')
  String title;

  Stories(
    this.images,
    this.type,
    this.id,
    this.gaPrefix,
    this.title,
  );

  factory Stories.fromJson(Map<String, dynamic> srcJson) =>
      _$StoriesFromJson(srcJson);
}

@JsonSerializable()
class Top_stories extends Object {
  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'ga_prefix')
  String gaPrefix;

  @JsonKey(name: 'title')
  String title;

  Top_stories(
    this.image,
    this.type,
    this.id,
    this.gaPrefix,
    this.title,
  );

  factory Top_stories.fromJson(Map<String, dynamic> srcJson) =>
      _$Top_storiesFromJson(srcJson);
}
