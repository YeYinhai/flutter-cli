/*
 * Author : yyh
 * Email : 362127358@qq.com
 * -----
 * Description: 
 * -----
 * Created: 2019-03-01 10:15:06
 * -----
 * Last Modified: Friday March 1st 2019 10:15:06 am
 * Modified By: the developer formerly known as yyh at <362127358@qq.com>
 * -----
 */
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends Object {
  @JsonKey(name: 'body')
  String body;

  @JsonKey(name: 'image_source')
  String imageSource;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'share_url')
  String shareUrl;

  @JsonKey(name: 'js')
  List<dynamic> js;

  @JsonKey(name: 'ga_prefix')
  String gaPrefix;

  @JsonKey(name: 'images')
  List<String> images;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'css')
  List<String> css;

  News(
    this.body,
    this.imageSource,
    this.title,
    this.image,
    this.shareUrl,
    this.js,
    this.gaPrefix,
    this.images,
    this.type,
    this.id,
    this.css,
  );

  factory News.fromJson(Map<String, dynamic> srcJson) =>
      _$NewsFromJson(srcJson);
}
