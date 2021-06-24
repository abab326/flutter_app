import 'package:flutter/widgets.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print(size);
    Path path = Path();
    path.lineTo(0, size.height);
    // 三阶贝塞尔曲线画弧
    path.cubicTo(size.width / 8, size.height*0.8,
        size.width / 4, size.height *0.9,
        size.width*3/8, size.height*0.85);
    path.lineTo(size.width,size.height*0.85);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
  return true;
  }

}