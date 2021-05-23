import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var defaultThemeData = ThemeData(primarySwatch: Colors.blue);
  ThemeData _themeData;

  get themeData => _themeData ?? defaultThemeData;

  void updateTheme(ThemeData themeData) {
    this._themeData = themeData;
    notifyListeners();
  }
}
