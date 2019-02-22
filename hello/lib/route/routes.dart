/**
 * 路由配置
 * Create by yyh
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {
  static Router router;

  static String root = "/";
  static String page1 = "/page1";
  static String page2 = "/page2";
  static String webview = "/webview";
  static String videoDetail = "/videoDetail";

  static void configureRoutes(Router router) {
    router.define(root, handler: homeRouteHandler);
    router.define(page1, handler: page1RouteHandler);
    router.define(page2, handler: page2RouteHandler);

    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("未找到路由 !!!");
    });

    Routes.router = router;
  }
}
