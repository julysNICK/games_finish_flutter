import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2358349, size.height * 0.9995462);
    path_0.cubicTo(
        size.width * 0.1402069,
        size.height * 0.9866050,
        size.width * 0.1162574,
        size.height * 0.6288387,
        size.width * 0.02063146,
        size.height * 0.6157529);
    path_0.cubicTo(
        size.width * 0.01158095,
        size.height * 0.6145143,
        size.width * -0.002564103,
        size.height * 0.6157529,
        size.width * -0.002564103,
        size.height * 0.6157529);
    path_0.lineTo(size.width * -0.002564103, 0);
    path_0.lineTo(size.width, 0);
    path_0.cubicTo(
        size.width,
        0,
        size.width * 0.9334590,
        size.height * 0.3640924,
        size.width * 0.8659821,
        size.height * 0.5018807);
    path_0.cubicTo(
        size.width * 0.7430179,
        size.height * 0.7529739,
        size.width * 0.6335641,
        size.height * 0.3643916,
        size.width * 0.4948513,
        size.height * 0.5018807);
    path_0.cubicTo(
        size.width * 0.3825923,
        size.height * 0.6131504,
        size.width * 0.3530308,
        size.height * 1.015395,
        size.width * 0.2358349,
        size.height * 0.9995462);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(Offset(size.width * -0.2564103, 0),
        Offset(size.width * 0.1674208, size.height * 1.830454), [
      const Color(0xffEECE13).withOpacity(1),
      const Color(0xffB210FF).withOpacity(1)
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
