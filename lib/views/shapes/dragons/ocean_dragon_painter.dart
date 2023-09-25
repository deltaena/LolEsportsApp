import 'package:flutter/cupertino.dart';

import '../base_dragon_painter.dart';

class OceanDragonPainter extends BaseShapePainter {
@override
void paint(Canvas canvas, Size size) {

  customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);
  
Path path_0 = Path();
customMoveTo(path_0, 14,11.272025);
customCubicTo(path_0, 14,9.952875,12.87125,9.44695,12.87125,9.44695);
customCubicTo(path_0, 12.87125,9.44695,13.38225,8.4323,13.38225,7.648825);
customCubicTo(path_0, 13.38225,4.919525,11.339125,2,7.911225,2);
customCubicTo(path_0, 3.984225,2,2.41325,6.1566,2.41325,6.1566);
customCubicTo(path_0, 2.41325,6.1566,1.932875,5.452575,2.08425,3.761025);
customCubicTo(path_0, 2.08425,3.761025,0,5.522225,0,9.19355);
customCubicTo(path_0, 0,12.138275,2.055375,15.65,5.7512,15.65);
customCubicTo(path_0, 8.239,15.65,9.910075,13.554725,9.910075,11.2869);
customCubicTo(path_0, 9.910075,9.141925,8.16095,7.872475,6.523125,7.872475);
customCubicTo(path_0, 5.453525,7.872475,4.567675,8.64755,4.567675,8.64755);
customCubicTo(path_0, 4.86745,7.1303,6.50195,6.52375,6.50195,6.52375);
customCubicTo(path_0, 7.092925,3.727425,10.506825,4.049425,10.506825,4.049425);
customCubicTo(path_0, 10.506825,4.049425,9.08005,4.797375,8.588475,6.1524);
customCubicTo(path_0, 8.588475,6.1524,12.0211,7.341525,12.0211,11.19765);
customCubicTo(path_0, 12.0211,13.94445,10.213875,15.407275,10.213875,15.407275);
customCubicTo(path_0, 10.213875,15.407275,11.930625,14.51145,13.0858,12.63615);
customCubicTo(path_0, 13.323975,12.94065,13.347075,13.3806,13.347075,13.3806);
customCubicTo(path_0, 13.347075,13.3806,14,12.591175,14,11.272025);

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff67C4B0).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}