import 'package:flutter/material.dart';

import '../shapes/icons/app_icon_painter.dart';

class DeltaAppBar extends AppBar {

  @override
  final title = CustomPaint(
      size: const Size(60, 60),
      painter: AppIconPainter(Colors.white)
  );

  DeltaAppBar({super.key});

}