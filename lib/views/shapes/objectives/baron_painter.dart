import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';

class BaronPainter extends BaseShapePainter {

  final Color color;

  BaronPainter(this.color);


  @override
void paint(Canvas canvas, Size size) {

  customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);

  Path path_0 = Path();
customMoveTo(path_0, 17,12.5049);
customCubicTo(path_0, 17,13.3299,16.331,13.9999,15.504,13.9999);
customLineTo(path_0, 15.496,13.9999);
customCubicTo(path_0, 14.669,13.9999,14,13.3299,14,12.5049);
customLineTo(path_0, 14,12.4949);
customCubicTo(path_0, 14,11.6699,14.669,10.9999,15.496,10.9999);
customLineTo(path_0, 15.504,10.9999);
customCubicTo(path_0, 16.331,10.9999,17,11.6699,17,12.4949);
customLineTo(path_0, 17,12.5049);
path_0.close();
customMoveTo(path_0, 13,10.0079);
customCubicTo(path_0, 13,10.5559,12.556,10.9999,12.008,10.9999);
customLineTo(path_0, 11.992,10.9999);
customCubicTo(path_0, 11.444,10.9999,11,10.5559,11,10.0079);
customLineTo(path_0, 11,9.9919);
customCubicTo(path_0, 11,9.4439,11.444,8.9999,11.992,8.9999);
customLineTo(path_0, 12.008,8.9999);
customCubicTo(path_0, 12.556,8.9999,13,9.4439,13,9.9919);
customLineTo(path_0, 13,10.0079);
path_0.close();
customMoveTo(path_0, 13,15.0099);
customCubicTo(path_0, 13,15.5569,12.557,15.9999,12.01,15.9999);
customLineTo(path_0, 11.99,15.9999);
customCubicTo(path_0, 11.443,15.9999,11,15.5569,11,15.0099);
customLineTo(path_0, 11,14.9899);
customCubicTo(path_0, 11,14.4429,11.443,13.9999,11.99,13.9999);
customLineTo(path_0, 12.01,13.9999);
customCubicTo(path_0, 12.557,13.9999,13,14.4429,13,14.9899);
customLineTo(path_0, 13,15.0099);
path_0.close();
customMoveTo(path_0, 10,12.5139);
customCubicTo(path_0, 10,13.3349,9.334,13.9999,8.514,13.9999);
customLineTo(path_0, 8.486,13.9999);
customCubicTo(path_0, 7.666,13.9999,7,13.3349,7,12.5139);
customLineTo(path_0, 7,12.4859);
customCubicTo(path_0, 7,11.6659,7.666,10.9999,8.486,10.9999);
customLineTo(path_0, 8.514,10.9999);
customCubicTo(path_0, 9.334,10.9999,10,11.6659,10,12.4859);
customLineTo(path_0, 10,12.5139);
path_0.close();
customMoveTo(path_0, 22,5.9999);
customLineTo(path_0, 15,1.9999);
customLineTo(path_0, 15,3.9999);
customLineTo(path_0, 18,6.9999);
customLineTo(path_0, 16,8.9999);
customLineTo(path_0, 12,4.9999);
customLineTo(path_0, 8,8.9999);
customLineTo(path_0, 6,6.9999);
customLineTo(path_0, 9,3.9999);
customLineTo(path_0, 9,1.9999);
customLineTo(path_0, 2,5.9999);
customLineTo(path_0, 6,10.9999);
customLineTo(path_0, 2,14.9999);
customLineTo(path_0, 5,18.9999);
customLineTo(path_0, 5,14.9999);
customLineTo(path_0, 7,14.9999);
customLineTo(path_0, 8,19.9999);
customLineTo(path_0, 10,21.9999);
customLineTo(path_0, 10,17.9999);
customLineTo(path_0, 12,19.9999);
customLineTo(path_0, 14,17.9999);
customLineTo(path_0, 14,21.9999);
customLineTo(path_0, 16,19.9999);
customLineTo(path_0, 17,14.9999);
customLineTo(path_0, 19,14.9999);
customLineTo(path_0, 19,18.9999);
customLineTo(path_0, 22,14.9999);
customLineTo(path_0, 18,10.9999);
customLineTo(path_0, 22,5.9999);
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