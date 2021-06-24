
import 'package:flutter_app/mvp/iview.dart';

abstract class IPresenter<V extends IView> {

 void attachView(V view);
 void destroyed();
}