import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';

class TowerPainter extends BaseShapePainter {

  @override
  final Size originalSize = Size(26.h, 26.h);

  final Color color;

  TowerPainter(this.color);

@override
void paint(Canvas canvas, Size size) {

  customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);

  Path path_0 = Path();
customMoveTo(path_0, 9.0004,1.0004);
customLineTo(path_0, 9.0004,5.9994);
customLineTo(path_0, 6.9994,5.0004);
customLineTo(path_0, 4.0004,6.9994);
customLineTo(path_0, 4.9994,11.0004);
customLineTo(path_0, 12.0004,14.9994);
customLineTo(path_0, 19.0004,11.0004);
customLineTo(path_0, 20.0004,6.9994);
customLineTo(path_0, 16.9994,5.0004);
customLineTo(path_0, 14.9994,5.9994);
customLineTo(path_0, 14.9994,1.0004);
customLineTo(path_0, 9.0004,1.0004);
path_0.close();
customMoveTo(path_0, 11.0004,5.9994);
customLineTo(path_0, 11.0004,3.0004);
customLineTo(path_0, 13.0004,3.0004);
customLineTo(path_0, 13.0004,5.9994);
customLineTo(path_0, 12.0004,6.9994);
customLineTo(path_0, 11.0004,5.9994);
path_0.close();
customMoveTo(path_0, 15.9994,8.9994);
customLineTo(path_0, 12.0004,12.0004);
customLineTo(path_0, 7.9994,8.9994);
customLineTo(path_0, 12.0004,10.0004);
customLineTo(path_0, 15.9994,8.9994);
path_0.close();
customMoveTo(path_0, 12.0001,16.9997);
customLineTo(path_0, 16.0001,14.9997);
customLineTo(path_0, 15.0001,21.0007);
customLineTo(path_0, 16.9991,21.0007);
customLineTo(path_0, 16.9991,22.9997);
customLineTo(path_0, 7.0001,22.9997);
customLineTo(path_0, 7.0001,21.0007);
customLineTo(path_0, 9.0001,21.0007);
customLineTo(path_0, 7.9991,14.9997);
customLineTo(path_0, 12.0001,16.9997);
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