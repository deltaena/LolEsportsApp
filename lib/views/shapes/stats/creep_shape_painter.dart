import 'package:flutter/cupertino.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';

class CreepShapePainter extends BaseShapePainter {

  int fix = 3;

  @override
  Size originalSize = const Size(10, 10);

@override
void paint(Canvas canvas, Size size) {

  customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);

  Path path_0 = Path();
customMoveTo(path_0, 8.5,2);
customLineTo(path_0, 7.5,2);
customLineTo(path_0, 3,9);
customLineTo(path_0, 8,14);
customLineTo(path_0, 13,9);
path_0.close();
customMoveTo(path_0, 5,8);
customLineTo(path_0, 6,7);
customLineTo(path_0, 8,9);
customLineTo(path_0, 10,7);
customLineTo(path_0, 11,8);
customLineTo(path_0, 8,12.5);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = const Color.fromRGBO(0, 200, 200, .75);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}