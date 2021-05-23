import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/configs/application.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/pages/hone_page.dart';
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
    FluroRouter router = FluroRouter();
    Application.router = router;
    Routes.configureRoutes(Application.router);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeState()),
        ChangeNotifierProvider(create: (_) => LocaleState()),
      ],
      child: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      home: HomePage(),
    );
  }
}
