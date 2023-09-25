import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lol_esports/views/shapes/icons/app_icon_painter.dart';

class Loader extends StatelessWidget {

  final Size size = const Size(150, 150);
  final Color color = const Color.fromRGBO(47, 223, 246, 1);

  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: animate(getLogo())
    );
  }

  CustomPaint getLogo(){
    return CustomPaint(
      size: size,
      painter: AppIconPainter(color),
    );
  }

  Animate animate(CustomPaint customPaint){
    return customPaint
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 1000.ms, color: Colors.white, angle: -45, size: 1.5)
        .animate();
  }
}