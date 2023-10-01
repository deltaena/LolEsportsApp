import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_esports/models/constants.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';
import 'package:tuple/tuple.dart';

import '../../../game_details/lib.dart';

class TeamsObjectives extends StatelessWidget {

  final Size objectiveIconSize = Size(35.h, 35.h);
  
  final Team blueTeam;
  final Team redTeam;

  final List<String> objectives = ["inhibitor", "baron", "towers", "kills"];

  static late BuildContext context;

  TeamsObjectives(this.blueTeam, this.redTeam, {super.key});
  
  @override
  Widget build(BuildContext context) {
    TeamsObjectives.context = context;

    return Row(
        children: [
          getTeamObjectives(blueTeam),
          getTeamObjectives(redTeam)
        ]
    );
  }

  Expanded getTeamObjectives(Team team){
    return Expanded(
        child: Row(
          children: (team.isBlue ? objectives : objectives.reversed).map((objective) => getColumnFor(objective, team)).toList(),
        )
    );
  }

  Expanded getColumnFor(String objective, Team team){
    Tuple2<BaseShapePainter, String> objectiveTuple = Constants.getObjectivePainterAndCount(objective, team);

    return Expanded(
      child: Column(
        children: [
          CustomPaint(
              size: objectiveIconSize,
              painter: objectiveTuple.item1
          ),
          Text(
            objectiveTuple.item2,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }

}