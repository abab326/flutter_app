
import 'package:flutter/widgets.dart';
/// 全局语言管理
class LocaleState extends ChangeNotifier {
  Locale _locale = Locale("zh");

  get local => _locale;

  void update(Locale locale){
    this._locale = locale;
    notifyListeners();
  }

}