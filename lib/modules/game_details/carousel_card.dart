import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_esports/modules/event_details/model.dart' as event_details;

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:lol_esports/modules/event_details/widgets/carousel_card_body/participants_structure.dart';
import 'package:lol_esports/modules/event_details/widgets/carousel_card_header/teams_dragons.dart';
import 'package:lol_esports/modules/event_details/widgets/carousel_card_header/teams_gold.dart';
import 'package:lol_esports/modules/event_details/widgets/carousel_card_header/teams_info.dart';
import 'package:lol_esports/modules/event_details/widgets/carousel_card_header/teams_objectives.dart';
import 'package:lol_esports/modules/game_details/model.dart';
import 'package:lol_esports/views/shapes/stats/creep_shape_painter.dart';
import 'package:lol_esports/views/shapes/stats/gold_shape_painter.dart';
import 'package:lol_esports/views/shapes/stats/kda_shape_painter.dart';

import '../../models/constants.dart';

class CarouselCard extends StatelessWidget {
  final event_details.Match match;
  final GameDetails gameDetails;

  late final event_details.MatchTeam blueMatchTeam;
  late final event_details.MatchTeam redMatchTeam;

  late final Team blueTeam;
  late final Team redTeam;

  late final int gameNumber;

  CarouselCard(this.match, this.gameDetails, {super.key}){
    int gameId = gameDetails.esportsGameId;

    blueTeam = gameDetails.frames.last.blueTeam;
    redTeam = gameDetails.frames.last.redTeam;

    int blueIndex = 0;
    int redIndex = 1;

    int blueTeamId = gameDetails.gameMetadata.blueTeamMetadata.esportsTeamId;

    if(match.teams[1].id == blueTeamId) { blueIndex = 1; redIndex = 0; }

    blueMatchTeam = match.teams[blueIndex];
    redMatchTeam = match.teams[redIndex];

    for (var game in match.games) {
      if(gameId == game.id) gameNumber = game.number;
    }

    print("game $gameNumber of ${match.teams[0].code} vs ${match.teams[1].code} is ${gameDetails.frames.last.gameState}");
  }

  static late BuildContext context;

  @override
  Widget build(BuildContext context) {
    CarouselCard.context = context;

    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TeamsInfo(blueMatchTeam, redMatchTeam, gameNumber),
              TeamsDragons(blueTeam, redTeam),
              TeamsGold(blueTeam, redTeam),
              TeamsObjectives(blueTeam, redTeam),
            ],
          )
        ),
        Expanded(
            flex: 8,
            child: ParticipantsStructure(blueTeam, redTeam, gameDetails.gameMetadata.blueTeamMetadata, gameDetails.gameMetadata.redTeamMetadata)
        )
      ],
    );
  }

  double convertToFractionOfOne(int number) {
    int numberOfDigits = number.toString().length;
    double result = number / (math.pow(10, numberOfDigits));
    return result;
  }

}