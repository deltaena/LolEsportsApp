import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';
import 'package:polygon/polygon.dart';

class KDAShapePainter extends BaseShapePainter {

  @override
  double fix = 3.h;

  @override
  Size originalSize = const Size(10, 10);

  KDAShapePainter();

  @override
  void paint(Canvas canvas, Size size) {

    customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);

    Path path_0 = Path();

    customLineTo(path_0, 8 ,9.43);
    customLineTo(path_0, 13, 5.78);
    customLineTo(path_0, 13, 3);
    customLineTo(path_0, 10.22, 3);
    customLineTo(path_0, 6.57, 8);
    customLineTo(path_0, 6.57, 8);
    customLineTo(path_0, 6.57, 8);
    customLineTo(path_0, 6.57, 9.43);
    customLineTo(path_0, 4.43, 7.29);
    customLineTo(path_0, 3.71, 9.43);
    customLineTo(path_0, 4.63, 10.34);
    customLineTo(path_0, 3, 11.97);
    customLineTo(path_0, 4.03, 13);
    customLineTo(path_0, 5.66, 11.37);
    customLineTo(path_0, 6.57, 12.29);
    customLineTo(path_0, 8.71, 11.57);
    customLineTo(path_0, 6.57, 9.43);
    customLineTo(path_0, 8, 9.43);
    customLineTo(path_0, 8, 9.43);

    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = const Color.fromRGBO(0, 200, 200, .75);
    canvas.drawPath(path_0,paint_0_fill);
  }

  @override
  bool shouldRepaint(KDAShapePainter oldDelegate) {
    return true;
  }
}