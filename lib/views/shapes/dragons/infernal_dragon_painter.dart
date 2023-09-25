import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';

//Copy this CustomPainter code to the Bottom of the File
class InfernalDragonPainter extends BaseShapePainter {

@override
void paint(Canvas canvas, Size size) {
    customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);

  Path path_0 = Path();
  customMoveTo(path_0, 6.185725,0);
  customCubicTo(path_0, 6.185725,0,6.68325,2.9099,6.23805,3.343375);
  customCubicTo(path_0, 5.79285,3.77685,2.274125,7.10675,2.274125,7.10675);
  customLineTo(path_0, 1.1004,5.78095);
  customLineTo(path_0, 0,9.82625);
  customCubicTo(path_0, 0,9.82625,1.6954,11.38935,2.48955,14.728);
  customLineTo(path_0, 7,17);
  customLineTo(path_0, 13.4652,12.0666);
  customLineTo(path_0, 14,9.041025);
  customLineTo(path_0, 12.7162,7.765625);
  customCubicTo(path_0, 12.7162,7.765625,12.951225,9.4052,12.354825,9.4052);
  customCubicTo(path_0, 11.75825,9.4052,10.6764,6.8957,9.88715,6.8957);
  customCubicTo(path_0, 9.098075,6.8957,8.401575,7.10115,6.9097,7.4508);
  customCubicTo(path_0, 5.718475,7.7301,5.26015,9.698675,5.12365,10.48075);
  customCubicTo(path_0, 5.090225,10.6729,5.171425,10.8668,5.33435,10.97985);
  customLineTo(path_0, 6.9097,12.347825);
  customCubicTo(path_0, 6.9097,12.347825,8.385125,11.378325,8.385125,10.723825);
  customCubicTo(path_0, 8.385125,10.221575,7.146825,10.252025,7.146825,9.30265);
  customCubicTo(path_0, 7.146825,8.75,7.6391,8.52985,8.262625,8.52985);
  customCubicTo(path_0, 9.99355,8.52985,10.6708,10.5721,10.6708,10.5721);
  customCubicTo(path_0, 9.404675,13.03785,6.9951,14.595,6.9951,14.595);
  customCubicTo(path_0, 6.9951,14.595,3.436475,12.154625,3.436475,10.63195);
  customCubicTo(path_0, 3.436475,6.427225,8.33595,5.31125,8.33595,5.31125);
  customLineTo(path_0, 8.98555,3.1598);
  customLineTo(path_0, 6.185725,0);
  path_0.close();

/*
Path path_0 = Path();
customMoveTo(path_0, 6.185725,0);
customCubicTo(path_0, 6.185725,0,6.68325,2.9099,6.23805,3.343375);
customCubicTo(path_0, 5.79285,3.77685,2.274125,7.10675,2.274125,7.10675);
customLineTo(path_0, 1.1004,5.78095);
customLineTo(path_0, 0,9.82625);
customCubicTo(path_0, 0,9.82625,1.6954,11.38935,2.48955,14.728);
customLineTo(path_0, 7,17);
customLineTo(path_0, 13.4652,12.0666);
customLineTo(path_0, 14,9.041025);
customLineTo(path_0, 12.7162,7.765625);
customCubicTo(path_0, 12.7162,7.765625,12.951225,9.4052,12.354825,9.4052);
customCubicTo(path_0, 11.75825,9.4052,10.6764,6.8957,9.88715,6.8957);
customCubicTo(path_0, 9.098075,6.8957,8.401575,7.10115,6.9097,7.4508);
customCubicTo(path_0, 5.718475,7.7301,5.26015,9.698675,5.12365,10.48075);
customCubicTo(path_0, 5.090225,10.6729,5.171425,10.8668,5.33435,10.97985);
customLineTo(path_0, 6.9097,12.347825);
customCubicTo(path_0, 6.9097,12.347825,8.385125,11.378325,8.385125,10.723825);
customCubicTo(path_0, 8.385125,10.221575,7.146825,10.252025,7.146825,9.30265);
customCubicTo(path_0, 7.146825,8.75,7.6391,8.52985,8.262625,8.52985);
customCubicTo(path_0, 9.99355,8.52985,10.6708,10.5721,10.6708,10.5721);
customCubicTo(path_0, 9.404675,13.03785,6.9951,14.595,6.9951,14.595);
customCubicTo(path_0, 6.9951,14.595,3.436475,12.154625,3.436475,10.63195);
customCubicTo(path_0, 3.436475,6.427225,8.33595,5.31125,8.33595,5.31125);
customLineTo(path_0, 8.98555,3.1598);
customLineTo(path_0, 6.185725,0);
path_0.close();
 */

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xffF26C23).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}