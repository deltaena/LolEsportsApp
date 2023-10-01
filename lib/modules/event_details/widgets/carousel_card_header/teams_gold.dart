import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../game_details/lib.dart';

class TeamsGold extends StatelessWidget {

  final double goldBarHeight = 20.h;
  MaterialAccentColor getBarColor(bool isBlue) =>  isBlue ? Colors.blueAccent : Colors.redAccent;
  TextAlign getTextAlign(bool isBlue) => isBlue ? TextAlign.start : TextAlign.end;

  final Team blueTeam;
  final Team redTeam;

  TeamsGold(this.blueTeam, this.redTeam, {super.key});

  static late BuildContext context;

  @override
  Widget build(BuildContext context) {
    TeamsGold.context = context;

    int totalGold = blueTeam.totalGold + redTeam.totalGold;

    double blueTeamGoldPercentage = ((blueTeam.totalGold * 100) / totalGold);
    double redTeamGoldPercentage = (100 - blueTeamGoldPercentage);

    return Row(
      children: [
        getGoldWidget(blueTeamGoldPercentage, blueTeam.totalGold, true),
        getGoldWidget(redTeamGoldPercentage, redTeam.totalGold, false)
      ],
    );
  }

  Expanded getGoldWidget(double goldFlex, int teamGold, bool isBlue){
    return Expanded(
        flex: goldFlex.round(),
        child: Container(
          height: goldBarHeight,
          color: getBarColor(isBlue),
          child: Text(
            teamGold.toString(),
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: getTextAlign(isBlue),
          ),
        )
    );
  }

}