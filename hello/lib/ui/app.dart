import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:hello/route/routes.dart';
import 'package:hello/store/app_state_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:hello/config/application.dart';
import 'package:hello/config/translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  @override
  State createState() {
    return new AppState();
  }
}

class AppState extends State<App> {
  //创建顶层状态
  AppStateModel countModel = AppStateModel();
  SpecificLocalizationDelegate _localeOverrideDelegate;

  @override
  void initState() {
    super.initState();

    /// 初始化一个新的Localization Delegate，有了它，当用户选择一种新的工作语言时，可以强制初始化一个新的Translations
    _localeOverrideDelegate = new SpecificLocalizationDelegate(null);

    /// 保存这个方法的指针，当用户改变语言时，我们可以调用applic.onLocaleChanged(new Locale('en',''));，通过SetState()我们可以强制App整个刷新
    applic.onLocaleChanged = onLocaleChange;
  }

  /// 改变语言时的应用刷新核心，每次选择一种新的语言时，都会创造一个新的SpecificLocalizationDelegate实例，强制Translations类刷新。
  onLocaleChange(Locale locale) {
    setState(() {
      _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

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
          localizationsDelegates: [
            _localeOverrideDelegate, // 注册一个新的delegate
            const TranslationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: applic.supportedLocales(),
        ));
    // print("initial route = ${app.initialRoute}");
    return app;
  }
}
