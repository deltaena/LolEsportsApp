import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';

class HextechDragonPainter extends BaseShapePainter {

  int fix = 3;

@override
void paint(Canvas canvas, Size size) {
  customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);

  Path path_1 = Path();

  customMoveTo(path_1, 13.4142,3);
  customLineTo(path_1, 13.4142,5.78423);
  customLineTo(path_1, 20,12.2808);
  customLineTo(path_1, 13.4142,18.7773);
  customLineTo(path_1, 11.0572,21);
  customLineTo(path_1, 11.0572,19.2414);
  customLineTo(path_1, 4,12.2808);
  customLineTo(path_1, 11.0572,5.32019);
  customLineTo(path_1, 13.4142,3);
  path_1.close();

  Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
  paint_1_fill.color = Color(0xff81D9F5).withOpacity(1.0);
  canvas.drawPath(path_1,paint_1_fill);

Path path_0 = Path();

  customMoveTo(path_0, 15.1231,10.1346);
  customLineTo(path_0, 17,11.9822);
  customLineTo(path_0, 12,16.9041);
  customLineTo(path_0, 7.00003,11.9822);
  customLineTo(path_0, 8.87694,10.1346);
  customLineTo(path_0, 12,13.2089);
  customLineTo(path_0, 15.1231,10.1346);
  path_0.close();
  customMoveTo(path_0, 14.0624,9.09049);
  customLineTo(path_0, 12,11.1207);
  customLineTo(path_0, 9.9376,9.09055);
  customLineTo(path_0, 12,7.06034);
  customLineTo(path_0, 14.0624,9.09049);
  path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color.fromRGBO(10, 14, 19, 25);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}