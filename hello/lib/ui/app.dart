import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:hello/route/routes.dart';
import 'package:hello/store/app_state_model.dart';
import 'package:scoped_model/scoped_model.dart';

class App extends StatefulWidget {
  @override
  State createState() {
    return new AppState();
  }
}

class AppState extends State<App> {
  //创建顶层状态
  AppStateModel countModel = AppStateModel();

  AppState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Routes.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = ScopedModel<AppStateModel>(
        model: countModel,
        child: new MaterialApp(
          title: '你好',
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: Routes.router.generator,
        ));
    // print("initial route = ${app.initialRoute}");
    return app;
  }
}
