import 'package:flutter/cupertino.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';

class CloudDragonPainter extends BaseShapePainter {
@override
void paint(Canvas canvas, Size size) {

  customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);
  
Path path_0 = Path();
customMoveTo(path_0, 3.839325,1);
customCubicTo(path_0, 3.839325,1,8.2243,2.667575,8.2243,6.623975);
customCubicTo(path_0, 8.2243,10.4591,1.939175,10.2722,1.939175,14.969375);
customCubicTo(path_0, 1.939175,15.96705,2.63515,17.3401,2.63515,17.3401);
customCubicTo(path_0, 2.63515,17.3401,0,15.71505,0,13.447575);
customCubicTo(path_0, 0,9.575175,4.95565,11.117975,4.95565,4.486);
customCubicTo(path_0, 4.95565,2.01885,3.839325,1,3.839325,1);
customMoveTo(path_0, 12.4478333,8.7884625);
customCubicTo(path_0, 12.4478333,10.2183875,11.3421833,12.5586625,8.51803332,12.5586625);
customCubicTo(path_0, 4.30910832,12.5586625,3.72618332,14.4448125,3.72618332,14.4448125);
customCubicTo(path_0, 2.98505832,11.7594375,10.5375333,9.9887875,10.5375333,5.9735875);
customCubicTo(path_0, 10.5375333,4.1395875,9.63558332,3.1321125,9.63558332,3.1321125);
customCubicTo(path_0, 9.63558332,3.1321125,12.4478333,5.0774125,12.4478333,8.7884625);
customMoveTo(path_0, 4.55,15.75691);
customCubicTo(path_0, 5.138175,14.079535,6.3917,13.71641,6.3917,13.71641);
customCubicTo(path_0, 6.3917,13.71641,7.9394,14.238085,8.6177,14.238085);
customCubicTo(path_0, 11.88495,14.238085,13.846175,10.297785,13.846175,10.297785);
customCubicTo(path_0, 13.846175,10.297785,14.870975,13.87391,11.552275,17.450035);
customCubicTo(path_0, 11.552275,17.450035,9.60295,15.161035,7.14315,15.161035);
customCubicTo(path_0, 5.651975,15.161035,4.55,15.75691,4.55,15.75691);

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xffADD2ED).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}