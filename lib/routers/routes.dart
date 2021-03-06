import 'package:fluro/fluro.dart';
import 'package:flutter_app/routers/route_handlers.dart';

class Routes{
  static final String root  = "/";
  static final String login  = "/login";
  static final String home  = "/home";


  static void configureRoutes(FluroRouter rootRouter){
    rootRouter.define(root, handler: rootHandler,transitionType: TransitionType.inFromRight);
    rootRouter.define(login, handler: loginHandler,transitionType: TransitionType.inFromRight);
    rootRouter.define(home, handler: homeHandler,transitionType: TransitionType.inFromRight);
  }
}