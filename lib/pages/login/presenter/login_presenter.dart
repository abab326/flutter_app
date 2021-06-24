import 'package:flutter_app/base/base_presenter.dart';
import 'package:flutter_app/pages/login/interface/login_view.dart';
import 'package:flutter_app/pages/login/model/login_model.dart';

class LoginPresenter extends BasePresenter<ILoginView,LoginModel> {
  @override
  LoginModel createModel() {
     return LoginModel();
  }
}