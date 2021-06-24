import 'package:flutter/material.dart';

/// 全局主题管理
class ThemeState extends ChangeNotifier {
  var defaultThemeData = ThemeData(
      primarySwatch: Colors.blue,
      backgroundColor: Colors.grey[100],
      scaffoldBackgroundColor: Colors.grey[100]);
  ThemeData _themeData;

  get themeData => _themeData ?? defaultThemeData;

  void updateTheme(ThemeData themeData) {
    this._themeData = themeData;
    notifyListeners();
  }
}
