import 'package:flutter/cupertino.dart';

abstract class BaseShapePainter extends CustomPainter {

  int fix = 0;

  final Size originalSize = const Size(14, 18);
  late Size customSize;

  customMoveTo(Path path, double x, double y){
    path.moveTo(getRelativePointX(x - fix), getRelativePointY(y - fix));
  }

  customCubicTo(Path path, double x1, double y1, double x2, double y2, double x3, double y3){
    path.cubicTo(getRelativePointX(x1 - fix), getRelativePointY(y1 - fix), getRelativePointX(x2 - fix), getRelativePointY(y2 - fix), getRelativePointX(x3 - fix), getRelativePointY(y3 - fix));
  }

  customLineTo(Path path, double x, double y){
    path.lineTo(getRelativePointX(x - fix), getRelativePointY(y - fix));
  }

  customArcToPoint(Path path, Offset arcEnd, Radius radius){
    path.arcToPoint(getRelativeOffset(arcEnd), radius: getRelativeRadius(radius), rotation: 0.0, largeArc: false, clockwise: true);
  }

  Radius getRelativeRadius(Radius radius){
    return Radius.elliptical(getRelativePointX(radius.x ), getRelativePointY(radius.y));
  }

  Offset getRelativeOffset(Offset offset){
    return Offset(getRelativePointX(offset.dx - fix), getRelativePointY(offset.dy - fix));
  }

  double getRelativePointX(double staticPoint){
    return (staticPoint * customSize.width) / originalSize.width;
  }

  double getRelativePointY(double staticPoint){
    return (staticPoint * customSize.height) / originalSize.height;
  }
}