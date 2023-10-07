import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lol_esports/modules/leagues_fetch/lib.dart' as leagues_f;
import 'package:lol_esports/modules/schedule/lib.dart' as schedule;

import '../shapes/icons/app_icon_painter.dart';

class DeltaDrawer extends StatelessWidget {

  final int headerLogoFlex = 10;
  final int headerButtonFlex = 4;

  final Decoration drawerHeaderDecoration = BoxDecoration(
      border: Border(
          bottom: BorderSide(color: Colors.white, width: 2.h)
      )
  );

  final Container appLogo = Container(
    alignment: Alignment.center,
    child: CustomPaint(size: Size(100.h, 100.h), painter: AppIconPainter(Colors.white)),
  );

  DeltaDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
                decoration: drawerHeaderDecoration,
                child: getHeaderStructure()
            ),
            const Expanded(child: leagues_f.ListBlocBuilder())
          ],
        )
    );
  }

  Column getHeaderStructure(){
    return Column(
        children: [
          Expanded(
              flex: headerLogoFlex,
              child: appLogo
          ),
          Expanded(
              flex: headerButtonFlex,
              child: const schedule.ButtonBlocBuilder()
          )
        ]
    );
  }
}