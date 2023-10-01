import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';

class ChemtechDragonPainter extends BaseShapePainter {

  @override
  double fix = 3;

@override
void paint(Canvas canvas, Size size) {

  customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);
  
Path path_0 = Path();
customMoveTo(path_0, 15.8377,6.24546);
customCubicTo(path_0, 16.8672,6.24546,17.2548,5.31013,16.7519,4.29806);
customCubicTo(path_0, 19.0471,5.60353,21.6148,9.13739,19.0471,11.381);
customCubicTo(path_0, 16.9304,13.2303,14.7314,12.2534,12.9652,10.2592);
customCubicTo(path_0, 11.8045,8.94874,8.13507,8.00911,8.13507,10.739);
customCubicTo(path_0, 8.13507,12.2439,9.19042,13.1114,10.6993,13.3874);
customCubicTo(path_0, 10.2969,13.1114,9.51962,12.1294,10.2969,11.1793);
customCubicTo(path_0, 11.2292,10.0399,13.2537,12.3425,14.7229,13.1114);
customCubicTo(path_0, 16.456,14.0183,18.2637,12.9588,19.2522,13.1771);
customCubicTo(path_0, 22.3776,13.8678,21.231,19.3125,16.456,18.6449);
customCubicTo(path_0, 14.197,18.3291,12.8524,17.8037,11.9707,18.6449);
customCubicTo(path_0, 10.8823,19.6832,13.3545,20.8856,14.2515,20.8856);
customCubicTo(path_0, 12.3763,21.5236,7.06641,19.3849,9.41883,17.1584);
customCubicTo(path_0, 10.0521,16.559,10.6749,16.3194,11.184,16.3316);
customCubicTo(path_0, 11.184,17.5007,12.9846,17.2448,13.7648,16.9625);
customCubicTo(path_0, 15.4769,16.3432,14.9583,14.428,13.3163,14.0183);
customCubicTo(path_0, 11.2766,13.5096,10.1287,17.3467,5.56753,15.8745);
customCubicTo(path_0, 3.83222,15.3145,3,13.9529,3,12.6649);
customCubicTo(path_0, 3,11.3768,3.84781,10.592,4.25016,10.0399);
customCubicTo(path_0, 3.9193,7.3383,4.8087,5.43267,6.15552,4.29806);
customCubicTo(path_0, 8.00363,2.74117,11.9707,2.39384,13.2701,4.31965);
customCubicTo(path_0, 13.6292,4.85177,14.4026,6.24546,15.8377,6.24546);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xffA4B72B).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}