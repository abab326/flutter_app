import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/configs/application.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/pages/hone_page.dart';
import 'package:flutter_app/pages/startup.dart';
import 'package:flutter_app/providers/LocaleState.dart';
import 'package:flutter_app/providers/ThemeState.dart';
import 'package:flutter_app/routers/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// 路由初始化
    FluroRouter router = FluroRouter();
    Application.router = router;
    Routes.configureRoutes(Application.router);
    /// 全局状态管理配置
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeState()),
        ChangeNotifierProvider(create: (_) => LocaleState()),
      ],
      child: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  StartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeState>().themeData,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: context.watch<LocaleState>().local,
      onGenerateRoute: Application.router.generator,
      initialRoute: "/",
      home: StartUpPage(),
    );
  }
}
