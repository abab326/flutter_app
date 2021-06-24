
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/hone_page.dart';
import 'package:flutter_app/pages/login/login_page.dart';
import 'package:flutter_app/pages/startup.dart';

final rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return StartUpPage();
    });

final loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return LoginPage();
    });

final homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return HomePage();
    });