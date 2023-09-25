import 'package:flutter/cupertino.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';

class InhibitorPainter extends BaseShapePainter {

  final Color color;

  InhibitorPainter(this.color);

@override
void paint(Canvas canvas, Size size) {

  customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);

  Path path_0 = Path();
customMoveTo(path_0, 12,2);
customCubicTo(path_0, 17.522,2,22,6.478,22,12);
customCubicTo(path_0, 22,17.522,17.522,22,12,22);
customCubicTo(path_0, 6.477,22,2,17.522,2,12);
customCubicTo(path_0, 2,6.478,6.477,2,12,2);
path_0.close();
customMoveTo(path_0, 12,4);
customCubicTo(path_0, 7.639,4,4,7.635,4,12);
customCubicTo(path_0, 4,16.365,7.639,20,12,20);
customCubicTo(path_0, 16.362,20,20,16.365,20,12);
customCubicTo(path_0, 20,7.635,16.362,4,12,4);
path_0.close();
customMoveTo(path_0, 12,8);
customLineTo(path_0, 16,12);
customLineTo(path_0, 12,16);
customLineTo(path_0, 8,12);
customLineTo(path_0, 12,8);
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