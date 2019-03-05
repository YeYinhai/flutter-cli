import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hello/route/routes.dart';
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:hello/store/app_state_model.dart';

///第一个界面
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  String message = '首页1';

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppStateModel>(builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () => intentTo(context))
          ],
        ),
        body: Center(child: Text('${model.count}' + message)),
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
