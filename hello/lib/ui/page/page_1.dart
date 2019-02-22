import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hello/route/routes.dart';
import 'dart:convert';

///第一个界面
class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Page1State();
}

class Page1State extends State<Page1> {
  String message = '一';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一个页面'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: () => intentTo(context))
        ],
      ),
      body: Center(child: Text(message)),
    );
  }

  ///跳转到第二个界面
  intentTo(BuildContext context) {
    ///字符串编码
    var json = jsonEncode(Utf8Encoder().convert('来自第一个界面'));
    Routes.router
        .navigateTo(context, '${Routes.page2}?message=$json', //跳转路径
            transition: TransitionType.inFromRight //过场效果
            )
        .then((result) {
      //回传值
      if (result != null) {
        message = result;
      }
    });
  }
}
