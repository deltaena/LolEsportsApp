import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shapes/icons/app_icon_painter.dart';

class DeltaAppBar extends AppBar {

  @override
  final title = CustomPaint(
      size: Size(60.h, 60.h),
      painter: AppIconPainter(Colors.white)
  );

  DeltaAppBar({super.key});

}