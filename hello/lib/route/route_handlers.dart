/**
 * 路由定义
 * Create by Songlcy
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hello/ui/page/home.dart';
import 'package:hello/ui/page/page_1.dart';
import 'package:hello/ui/page/page_2.dart';

// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

var homeRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Home();
});

var page1RouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Page1();
});

var page2RouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  var message = params['message']?.first; //取出传参
  return Page2(message);
});

// var webviewRouteHandler = Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     String title = params["title"]?.first;
//     String url = params["url"]?.first;
//     return WebviewScaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(title),
//       ),
//       url: url,
//     );
//   }
// );
