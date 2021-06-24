import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/configs/application.dart';
import 'package:flutter_app/routers/routes.dart';

class StartUpPage extends StatefulWidget {
  StartUpPage({Key key}) : super(key: key);

  @override
  _StartUpPageState createState() {
    return _StartUpPageState();
  }
}

class _StartUpPageState extends State<StartUpPage> {
  int totalNum = 3;
  int currentNum;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    startCountDow();
  }

  @override
  void dispose() {
    super.dispose();
  }

  startCountDow() {
    currentNum = 0;
    _timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
      this.setState(() {
        currentNum += 1;
        if (currentNum == totalNum) {
          _timer.cancel();
          Application.router.navigateTo(context, Routes.login,replace: true,clearStack: true);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          constraints: BoxConstraints.expand(),
          child: Image.network(
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F201704%2F02%2F20170402110236_mwLMV.thumb.400_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627025475&t=d0762e4233d0f2843a55178ec6b47f8a",
            fit: BoxFit.fill,
          ),
        ),
        Align(
          child: TextButton(
            child: Text("$currentNum/$totalNum"),
          ),
        )
      ]),
    );
  }
}
