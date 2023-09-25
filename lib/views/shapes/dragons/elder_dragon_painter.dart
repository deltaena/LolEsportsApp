import 'package:flutter/cupertino.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';

class ElderDragonPainter extends BaseShapePainter {
@override
void paint(Canvas canvas, Size size) {

  customSize = Size((originalSize.width * size.height) / originalSize.height, size.height);
  
Path path_0 = Path();
customMoveTo(path_0, 9.282525,10.64335);
customCubicTo(path_0, 8.611225,11.44178,0.069075,11.3129,8.069075,11.3129);
customLineTo(path_0, 8.5337,10.192725);
customLineTo(path_0, 9.721425,9.252625);
customCubicTo(path_0, 9.721425,9.252625,9.953825,9.845,9.282525,10.64335);
customMoveTo(path_0, 7.843325,16.17685);
customCubicTo(path_0, 7.843325,16.17685,7.503475,15.613875,7.33355,15.332475);
customLineTo(path_0, 6.999825,15.84645);
customLineTo(path_0, 6.6661,15.332475);
customCubicTo(path_0, 6.496175,15.613875,6.156325,16.17685,6.156325,16.17685);
customCubicTo(path_0, 6.156325,16.17685,5.438825,15.278575,5.438825,14.298925);
customCubicTo(path_0, 5.438825,13.31945,5.6182,12.50605,5.6182,12.50605);
customLineTo(path_0, 6.107325,13.987425);
customLineTo(path_0, 6.49425,13.6978);
customCubicTo(path_0, 6.49425,13.6978,6.605025,14.05165,6.999825,14.5693);
customCubicTo(path_0, 7.39445,14.05165,7.505225,13.6978,7.505225,13.6978);
customLineTo(path_0, 7.892325,13.987425);
customLineTo(path_0, 8.381275,12.50605);
customCubicTo(path_0, 8.381275,12.50605,8.560825,13.31945,8.560825,14.298925);
customCubicTo(path_0, 8.560825,15.278575,7.843325,16.17685,7.843325,16.17685);
customMoveTo(path_0, 4.149775,9.252625);
customLineTo(path_0, 5.424125,10.192725);
customLineTo(path_0, 5.922875,11.4956);
customCubicTo(path_0, 5.922875,11.4956,4.149775,11.213325,4.149775,9.252625);
customMoveTo(path_0, 9.493575,-0.0005);
customLineTo(path_0, 9.02265,0.513475);
customLineTo(path_0, 9.194325,4.331625);
customCubicTo(path_0, 9.194325,4.331625,10.231725,5.096725,10.231725,6.0405);
customCubicTo(path_0, 10.231725,6.730525,9.767975,7.222975,9.276225,7.222975);
customCubicTo(path_0, 8.56765,7.222975,8.02585,6.47275,8.29395,5.55505);
customLineTo(path_0, 7.000175,3.375775);
customLineTo(path_0, 6.999825,3.375775);
customLineTo(path_0, 5.705875,5.55505);
customCubicTo(path_0, 5.973975,6.47275,5.432175,7.222975,4.723775,7.222975);
customCubicTo(path_0, 4.232025,7.222975,3.768275,6.730525,3.768275,6.0405);
customCubicTo(path_0, 3.768275,5.096725,4.8055,4.331625,4.8055,4.331625);
customLineTo(path_0, 4.977175,0.513475);
customLineTo(path_0, 4.50625,-0.0005);
customCubicTo(path_0, 4.50625,3.448925,0,6.669975,0,10.24505);
customCubicTo(path_0, 0,12.510425,2.260475,13.944725,2.260475,16.217625);
customCubicTo(path_0, 2.260475,16.217625,2.6649,15.643625,2.6649,14.24555);
customCubicTo(path_0, 2.6649,12.8473,2.1504,12.74125,2.1504,11.87395);
customCubicTo(path_0, 2.1504,11.006825,2.927225,10.17225,2.927225,10.17225);
customCubicTo(path_0, 2.927225,11.666925,4.60985,12.917825,4.60985,13.628675);
customCubicTo(path_0, 4.60985,14.612525,5.48485,17.4995,7,17.4995);
customCubicTo(path_0, 8.514975,17.4995,9.39015,14.612525,9.39015,13.628675);
customCubicTo(path_0, 9.39015,12.917825,11.0726,11.666925,11.0726,10.17225);
customCubicTo(path_0, 11.0726,10.17225,11.849425,11.006825,11.849425,11.87395);
customCubicTo(path_0, 11.849425,12.74125,11.334925,12.8473,11.334925,14.24555);
customCubicTo(path_0, 11.334925,15.643625,11.73935,16.217625,11.73935,16.217625);
customCubicTo(path_0, 11.73935,13.944725,14,12.510425,14,10.24505);
customCubicTo(path_0, 14,6.669975,9.493575,3.448925,9.493575,-0.0005);

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xffC9BCDC).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}