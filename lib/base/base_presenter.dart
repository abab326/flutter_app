
import 'package:flutter/foundation.dart';
import 'package:flutter_app/mvp/imodel.dart';
import 'package:flutter_app/mvp/ipresenter.dart';
import 'package:flutter_app/mvp/iview.dart';

abstract class BasePresenter<V extends IView,M extends IModel> extends IPresenter<V> {
  @protected V mView;
  @protected M mModel;

  @override
  void attachView(V view) {
    this.mView = view;
    if(mModel==null){
      mModel = createModel();
    }
  }

  @override
  void destroyed() {

  }

  M createModel();

}