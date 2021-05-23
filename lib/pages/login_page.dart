import 'package:flutter/material.dart';
import 'package:flutter_app/providers/LocaleState.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPage"),
      ),
      body: Center(
        child: TextButton(onPressed: ()=>Provider.of<LocaleState>(context,listen: false).update(Locale("en")),
            child: Text("LoginPage")),
      ),
    );
  }
}
