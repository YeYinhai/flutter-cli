/*
 * Author : yyh
 * Email : 362127358@qq.com
 * -----
 * Description: 知乎新闻
 * -----
 * Created: 2019-03-01 10:07:52
 * -----
 * Last Modified: Friday March 1st 2019 10:07:52 am
 * Modified By: the developer formerly known as yyh at <362127358@qq.com>
 * -----
 */

import 'package:scoped_model/scoped_model.dart';
import 'package:hello/util/http_util.dart';
import '../apis.dart';
import '../entity/news.dart';
import '../entity/news_latest.dart';

class NewsModel extends Model {
  News _news = null;
  NewsLatest _newsLatest = null;

  get news => _news;
  get newsLatest => _newsLatest;

  void getNews(id) {
    HttpUtil().get(Apis.NEWS, data: id, cancelToken: (data) {
      _news = News.fromJson(data);
      notifyListeners();
    });
  }

  void getNewsLatest() {
    HttpUtil().get(Apis.NEWS_LATEST, cancelToken: (data) {
      _newsLatest = NewsLatest.fromJson(data);
      notifyListeners();
    });
  }
}
