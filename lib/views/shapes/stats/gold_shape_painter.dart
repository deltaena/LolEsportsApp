import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';

class GoldShapePainter extends BaseShapePainter {

  @override
  double fix = 3.h;

  @override
  Size originalSize = const Size(10, 10);
  
  @override
  void paint(Canvas canvas, Size size) {

    customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);


    Path path_0 = Path();
  customMoveTo(path_0,13,6.86);
  customCubicTo(path_0,13,8,11.21,9,9,9);
  customCubicTo(path_0,6.789999999999999,9,5,8,5,6.86);
  customLineTo(path_0,5,5.14);
  customCubicTo(path_0,5,4,6.79,3,9,3);
  customCubicTo(path_0,11.21,3,13,4,13,5.140000000000001);
  path_0.close();

  Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
  paint_0_fill.color = const Color.fromRGBO(0, 200, 200, .75);
  canvas.drawPath(path_0,paint_0_fill);

  Path path_1 = Path();
  customMoveTo(path_1,7,7.71);
  customArcToPoint(path_1,Offset(9.4,8.35), Radius.elliptical(4, 4),);
  customLineTo(path_1,9.4,9.65);
  customArcToPoint(path_1,Offset(7,10.290000000000001), Radius.elliptical(4, 4),);
  customArcToPoint(path_1,Offset(4.6,9.65), Radius.elliptical(4, 4),);
  customLineTo(path_1,4.6,8.35);
  customArcToPoint(path_1,Offset(7,7.71), Radius.elliptical(4, 4),);
  customMoveTo(path_1,7,6);
  customCubicTo(path_1,4.79,6,3,7,3,8.14);
  customLineTo(path_1,3,9.86);
  customCubicTo(path_1,3,11,4.79,12,7,12);
  customCubicTo(path_1,9.21,12,11,11,11,9.86);
  customLineTo(path_1,11,8.14);
  customCubicTo(path_1,11,7,9.21,6,7,6);
  path_1.close();

  Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
  paint_1_fill.color = const Color.fromRGBO(0, 200, 200, .75);
  canvas.drawPath(path_1,paint_1_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return true;
  }
  }