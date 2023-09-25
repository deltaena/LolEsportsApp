import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';

import '../base_dragon_painter.dart';

//Copy this CustomPainter code to the Bottom of the File
class MountainDragonPainter extends BaseShapePainter {

@override
void paint(Canvas canvas, Size size) {
  customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);
  
Path path_0 = Path();
customMoveTo(path_0, 3,4.5);
customLineTo(path_0, 6,16);
customLineTo(path_0, 5,17);
customLineTo(path_0, 1,12.0302388);
customLineTo(path_0, 1,7.07612197);
customLineTo(path_0, 3,4.5);
path_0.close();
customMoveTo(path_0, 6.50012207,13);
customLineTo(path_0, 4.5,3);
customLineTo(path_0, 6,1);
customLineTo(path_0, 8,1);
customLineTo(path_0, 9.5,3);
customLineTo(path_0, 7.5,13);
customLineTo(path_0, 6.50012207,13);
path_0.close();
customMoveTo(path_0, 11,4.5);
customLineTo(path_0, 13,7.07612197);
customLineTo(path_0, 13,12.0302388);
customLineTo(path_0, 9,17);
customLineTo(path_0, 8,16);
customLineTo(path_0, 11,4.5);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xffA8805D).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}