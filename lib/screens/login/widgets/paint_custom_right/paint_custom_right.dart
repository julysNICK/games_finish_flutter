import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RPSCustomPainterRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -2.925191, size.height * 0.6293026);
    path_0.cubicTo(
        size.width * -2.934830,
        size.height * 0.7540000,
        size.width * -2.741223,
        size.height * 0.9266531,
        size.width * -2.342681,
        size.height * 0.8954797);
    path_0.cubicTo(
        size.width * -2.041436,
        size.height * 0.8719188,
        size.width * -2.315543,
        size.height * 0.7533358,
        size.width * -1.945106,
        size.height * 0.6862768);
    path_0.cubicTo(
        size.width * -1.574670,
        size.height * 0.6192140,
        size.width * -1.091383,
        size.height * 0.6393690,
        size.width * -0.8602287,
        size.height * 0.7497860);
    path_0.cubicTo(
        size.width * -0.6900085,
        size.height * 0.8310923,
        size.width * -0.9916968,
        size.height * 0.9086863,
        size.width * -0.8602287,
        size.height * 0.9963469);
    path_0.cubicTo(
        size.width * -0.5580383,
        size.height * 1.197841,
        size.width * 0.9408979,
        size.height * 1.153483,
        size.width * 0.9982362,
        size.height * 0.9328376);
    path_0.cubicTo(
        size.width * 1.036244,
        size.height * 0.7865830,
        size.width * 0.4492617,
        size.height * 0.7653173,
        size.width * 0.2677947,
        size.height * 0.6293026);
    path_0.cubicTo(
        size.width * 0.04731032,
        size.height * 0.4640480,
        size.width * 0.4993181,
        size.height * 0.3159343,
        size.width * 0.1414319,
        size.height * 0.1744694);
    path_0.cubicTo(
        size.width * -0.1292191,
        size.height * 0.06748672,
        size.width * -0.4383064,
        size.height * -0.03262406,
        size.width * -0.8602287,
        size.height * 0.01009365);
    path_0.cubicTo(
        size.width * -1.408181,
        size.height * 0.06557196,
        size.width * -0.3362798,
        size.height * 0.3846273,
        size.width * -0.8602287,
        size.height * 0.4583911);
    path_0.cubicTo(
        size.width * -1.103649,
        size.height * 0.4926605,
        size.width * -1.282043,
        size.height * 0.4703653,
        size.width * -1.547521,
        size.height * 0.4583911);
    path_0.cubicTo(
        size.width * -1.872043,
        size.height * 0.4437528,
        size.width * -2.024351,
        size.height * 0.3521339,
        size.width * -2.342681,
        size.height * 0.3762030);
    path_0.cubicTo(
        size.width * -2.728521,
        size.height * 0.4053764,
        size.width * -2.915872,
        size.height * 0.5088303,
        size.width * -2.925191,
        size.height * 0.6293026);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(Offset(size.width * -292.5532, 0),
        Offset(size.width * 0.2611606, size.height * 1.337288), [
      const Color(0xffFF6FD8).withOpacity(1),
      const Color(0xff3813C2).withOpacity(1)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
