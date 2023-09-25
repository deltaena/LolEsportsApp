
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';

class AppIconPainter extends BaseShapePainter {

  @override
  final Size originalSize = const Size(425, 425);

  final Color color;

  AppIconPainter(this.color);

@override
void paint(Canvas canvas, Size size) {

  customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);

  Path path_0 = Path();
customMoveTo(path_0, 94.73,94.85);
customLineTo(path_0, 188.85000000000002,94.85);
customLineTo(path_0, 188.85000000000002,47.37);
customLineTo(path_0, 115.85000000000002,47.37);
customCubicTo(path_0, 78.02000000000002,47.37,47.36000000000003,78.11,47.36000000000003,116.03);
customLineTo(path_0, 47.36000000000003,189.2);
customLineTo(path_0, 94.73000000000002,189.2);
customLineTo(path_0, 94.73000000000002,94.85);
path_0.close();
customMoveTo(path_0, 179.04,212.94);
customLineTo(path_0, 94.72999999999999,297.45);
customLineTo(path_0, 94.72999999999999,236.67999999999998);
customLineTo(path_0, 47.37,236.67999999999998);
customLineTo(path_0, 47.37,378.51);
customLineTo(path_0, 188.86,378.51);
customLineTo(path_0, 188.86,331.03);
customLineTo(path_0, 128.23000000000002,331.03);
customLineTo(path_0, 212.54000000000002,246.51);
customLineTo(path_0, 179.04,212.94);
path_0.close();
customMoveTo(path_0, 330.34,331.03);
customLineTo(path_0, 236.21999999999997,331.03);
customLineTo(path_0, 236.21999999999997,378.51);
customLineTo(path_0, 309.21999999999997,378.51);
customCubicTo(path_0, 347.04999999999995,378.51,377.71,347.77,377.71,309.85);
customLineTo(path_0, 377.71,236.68);
customLineTo(path_0, 330.34,236.68);
customLineTo(path_0, 330.34,331.03);
path_0.close();
customMoveTo(path_0, 236.22,47.37);
customLineTo(path_0, 236.22,94.85);
customLineTo(path_0, 296.85,94.85);
customLineTo(path_0, 212.54000000000002,179.37);
customLineTo(path_0, 246.03000000000003,212.94);
customLineTo(path_0, 330.34000000000003,128.42000000000002);
customLineTo(path_0, 330.34000000000003,189.19000000000003);
customLineTo(path_0, 377.71000000000004,189.19000000000003);
customLineTo(path_0, 377.71000000000004,47.37);
customLineTo(path_0, 236.22,47.37);
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