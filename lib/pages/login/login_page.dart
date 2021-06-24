import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/base/base_state.dart';
import 'package:flutter_app/configs/application.dart';
import 'package:flutter_app/pages/login/background_clipper.dart';
import 'package:flutter_app/pages/login/interface/login_view.dart';
import 'package:flutter_app/pages/login/presenter/login_presenter.dart';
import 'package:flutter_app/routers/routes.dart';
import 'package:flutter_picker/flutter_picker.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends BaseState<LoginPage, LoginPresenter>
    implements ILoginView {
  @override
  void initState() {
    super.initState();
  }

  showPicker() {
    Application.router.navigateTo(context, Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPage"),
      ),
      body: Column(
        children: [
          BackgroundWidget(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0),
            child: TextButton(
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
                ),
                onPressed: () => this.showPicker(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "登录",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  @override
  LoginPresenter createPresenter() {
    return LoginPresenter();
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: BackgroundClipper(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Container(
            color: Colors.red,
            constraints: BoxConstraints.expand(),
            child: Image.network(
              "https://t7.baidu.com/it/u=2581522032,2615939966&fm=193&f=GIF",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
