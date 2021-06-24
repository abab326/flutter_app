import 'package:flutter_app/base/base_presenter.dart';
import 'package:flutter_app/pages/main/interface/main_view.dart';
import 'package:flutter_app/pages/main/model/main_model.dart';

class MainPresenter extends BasePresenter<IMainView,MainModel> {
  @override
  MainModel createModel() {
     return MainModel();
  }
}