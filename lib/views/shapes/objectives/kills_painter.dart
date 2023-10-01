import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';

class KillsPainter extends BaseShapePainter {

  @override
  final Size originalSize = Size(26.h, 26.h);

  final Color color;

  KillsPainter(this.color);

@override
void paint(Canvas canvas, Size size) {
  
  customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);

  Path path_0 = Path();
customMoveTo(path_0, 16,3);
customLineTo(path_0, 9.001,12);
customLineTo(path_0, 9.001,13.5);
customLineTo(path_0, 6,10.5);
customLineTo(path_0, 5,14);
customLineTo(path_0, 6.501,15.5);
customLineTo(path_0, 3,19);
customLineTo(path_0, 3,21);
customLineTo(path_0, 5,21);
customLineTo(path_0, 8.5,17.5);
customLineTo(path_0, 10.001,19);
customLineTo(path_0, 13.501,18);
customLineTo(path_0, 10.5,15);
customLineTo(path_0, 12,15);
customLineTo(path_0, 21,8);
customLineTo(path_0, 21,3);
customLineTo(path_0, 16,3);
path_0.close();
customMoveTo(path_0, 10.5,12.75);
customLineTo(path_0, 17.001,6);
customLineTo(path_0, 18.001,6);
customLineTo(path_0, 18.001,7);
customLineTo(path_0, 11.251,13.5);
customLineTo(path_0, 10.5,13.5);
customLineTo(path_0, 10.5,12.75);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = color;
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}