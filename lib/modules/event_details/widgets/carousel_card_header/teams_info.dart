import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_network/image_network.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_esports/modules/event_details/model.dart' as event_details;

class TeamsInfo extends StatelessWidget {

  final int imageFlex = 3;
  final int textFlex = 4;

  final double teamImageSize = 70.h;


  final event_details.MatchTeam blueMatchTeam;
  final event_details.MatchTeam redMatchTeam;

  final int gameNumber;

  TeamsInfo(this.blueMatchTeam, this.redMatchTeam, this.gameNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getTeamImageWidget(blueMatchTeam.image),
        getGameInfoText(context),
        getTeamImageWidget(redMatchTeam.image),
      ],
    );
  }

  Expanded getTeamImageWidget(String imageUrl){
    return Expanded(
        flex: imageFlex,
        child: ImageNetwork(
          image: imageUrl,
          height: teamImageSize,
          width: teamImageSize,
          fitAndroidIos: BoxFit.contain,
        )
    );
  }

  Expanded getGameInfoText(BuildContext context){
    String matchString = "${blueMatchTeam.code} vs ${redMatchTeam.code}";
    String gameString = "game $gameNumber";

    return Expanded(
        flex: textFlex,
        child: Column(
          children: [
            Text(matchString, style: Theme.of(context).textTheme.titleMedium),
            Text(gameString, style: Theme.of(context).textTheme.bodyMedium)
          ],
        )
    );
  }
}