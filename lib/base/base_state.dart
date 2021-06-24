import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/mvp/ipresenter.dart';
import 'package:flutter_app/mvp/iview.dart';

abstract class BaseState<T extends StatefulWidget, P extends IPresenter> extends State<T>
    implements IView {
  @protected
  P presenter;

  /// 是否显示进度条
  bool _isShowProgress = false;

  @override
  void initState() {
    super.initState();
    if (presenter == null) {
      presenter = createPresenter();
      presenter.attachView(this);
    }
  }

  @override
  void dispose() {
    presenter.destroyed();
    super.dispose();
  }

  P createPresenter();


  @override
  void closeProgress() {
    if (_isShowProgress) {
      _isShowProgress = false;
      Navigator.of(context).pop();
    }
  }

  @override
  void showProgress() {
    if (!_isShowProgress) {
      showDialog(
        context: context,
        builder: (context) => SizedBox(
          width: 48,
          height: 48,
          child: CircularProgressIndicator(),
        ),
      ).then((value) => this.closeProgress());
      _isShowProgress = true;
    }
  }
}
