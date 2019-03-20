import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hello/route/routes.dart';
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:hello/store/app_state_model.dart';
import 'package:hello/config/translations.dart';

///第一个界面
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  String message = '首页1';

  List<String> addStr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  List<String> str = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();
  bool _loadMore = true;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppStateModel>(
        builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () => intentTo(context))
          ],
        ),
        body: Center(
            child: new EasyRefresh(
          key: _easyRefreshKey,
          behavior: ScrollOverBehavior(),
          refreshHeader: ClassicsHeader(
            key: _headerKey,
            refreshText: Translations.of(context).text("pullToRefresh"),
            refreshReadyText: Translations.of(context).text("releaseToRefresh"),
            refreshingText: Translations.of(context).text("refreshing") + "...",
            refreshedText: Translations.of(context).text("refreshed"),
            moreInfo: Translations.of(context).text("updateAt"),
            bgColor: Colors.transparent,
            textColor: Colors.black87,
            moreInfoColor: Colors.black54,
            showMore: true,
          ),
          refreshFooter: ClassicsFooter(
            key: _footerKey,
            loadText: Translations.of(context).text("pushToLoad"),
            loadReadyText: Translations.of(context).text("releaseToLoad"),
            loadingText: Translations.of(context).text("loading"),
            loadedText: Translations.of(context).text("loaded"),
            noMoreText: Translations.of(context).text("noMore"),
            moreInfo: Translations.of(context).text("updateAt"),
            bgColor: Colors.transparent,
            textColor: Colors.black87,
            moreInfoColor: Colors.black54,
            showMore: true,
          ),
          child: new ListView.builder(
              //ListView的Item
              itemCount: str.length,
              itemBuilder: (BuildContext context, int index) {
                return new Container(
                    height: 70.0,
                    child: Card(
                      child: new Center(
                        child: new Text(
                          model.newsLatest.stories[index].title,
                          style: new TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ));
              }),
          onRefresh: () async {
            await new Future.delayed(const Duration(seconds: 1), () {
              setState(() {
                str.clear();
                str.addAll(addStr);
                _easyRefreshKey.currentState.waitState(() {
                  setState(() {
                    _loadMore = true;
                  });
                });
              });
            });
          },
          loadMore: _loadMore
              ? () {
                  new Future.delayed(const Duration(seconds: 1), () {
                    if (str.length < 20) {
                      setState(() {
                        model.getNewsLatest();
                        str.addAll(addStr);
                      });
                    } else {
                      _easyRefreshKey.currentState.waitState(() {
                        setState(() {
                          _loadMore = false;
                        });
                      });
                    }
                  });
                }
              : null,
        )),
        persistentFooterButtons: <Widget>[
          FlatButton(
              onPressed: () {
                _easyRefreshKey.currentState.callRefresh();
              },
              child: Text(Translations.of(context).text("refresh"),
                  style: TextStyle(color: Colors.black))),
          FlatButton(
              onPressed: () {
                _easyRefreshKey.currentState.callLoadMore();
              },
              child: Text(Translations.of(context).text("loadMore"),
                  style: TextStyle(color: Colors.black)))
        ], // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }

  ///跳转到第二个界面
  intentTo(BuildContext context) {
    ///字符串编码
    var json = jsonEncode(Utf8Encoder().convert('来自第一个界面'));
    Routes.router
        .navigateTo(context, '${Routes.page2}?message=$json', //跳转路径
            transition: TransitionType.inFromRight) //过场效果
        .then((result) {
      //回传值
      if (result != null) {
        message = result;
      }
    });
  }
}
