import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_esports/models/constants.dart';

import '../../../game_details/lib.dart';

class TeamsDragons extends StatelessWidget {

  final Size dragonSize = Size(25.h, 25.h);

  final Team blueTeam;
  final Team redTeam;

  TeamsDragons(this.blueTeam, this.redTeam, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: blueTeam.dragons.isNotEmpty ? blueTeam.dragons.map(getDragonPaint).toList() : [],
          ),
          Row(
              children: redTeam.dragons.isNotEmpty ? redTeam.dragons.map(getDragonPaint).toList() : []
          )
        ]
    );
  }

  CustomPaint getDragonPaint(Dragon dragon){
    return CustomPaint(size: dragonSize, painter: Constants.getDragonPainter(dragon));
  }

}