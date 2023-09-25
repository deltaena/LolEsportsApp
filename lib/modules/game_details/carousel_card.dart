import 'dart:math' as math;

import 'package:lol_esports/modules/event_details/model.dart' as event_details;

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:lol_esports/modules/game_details/model.dart';
import 'package:lol_esports/views/shapes/stats/creep_shape_painter.dart';
import 'package:lol_esports/views/shapes/stats/gold_shape_painter.dart';
import 'package:lol_esports/views/shapes/stats/kda_shape_painter.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';
import 'package:tuple/tuple.dart';

import '../../models/constants.dart';

class CarouselCard extends StatelessWidget {
  final event_details.Match match;
  final GameDetails gameDetails;

  late final event_details.MatchTeam eBlueTeam;
  late final event_details.MatchTeam eRedTeam;

  late final Team mBlueTeam;
  late final Team mRedTeam;

  late final int gameNumber;

  CarouselCard(this.match, this.gameDetails, {super.key}){
    int gameId = gameDetails.esportsGameId;

    mBlueTeam = gameDetails.frames.last.blueTeam;
    mRedTeam = gameDetails.frames.last.redTeam;

    int blueIndex = 0;
    int redIndex = 1;

    int blueTeamId = gameDetails.gameMetadata.blueTeamMetadata.esportsTeamId;

    if(match.teams[1].id == blueTeamId) { blueIndex = 1; redIndex = 0; }

    eBlueTeam = match.teams[blueIndex];
    eRedTeam = match.teams[redIndex];

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
          child: getGameStats(),
        ),
        Expanded(
            flex: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: getParticipantsColumnFor(gameDetails.gameMetadata.blueTeamMetadata, mBlueTeam, true),
                ),
                Expanded(
                  flex: 1,
                  child: getParticipantsColumnFor(gameDetails.gameMetadata.redTeamMetadata, mRedTeam, false)
                ),
              ],
            )
        )
      ],
    );
  }

  Column getParticipantsColumnFor(TeamMetadata teamMetadata, Team team, bool isBlue){
    return Column(
      children: Role.values.map((role) {
        ParticipantMetadata participantMetadata = teamMetadata.getParticipant(role);
        Participant participantStats = team.getParticipant(participantMetadata.participantId);

        String participantName = participantMetadata.summonerName;
        String kda = "${participantStats.kills}/${participantStats.deaths}/${participantStats.assists}";

        List<Widget> kdaWidgets = [
          CustomPaint(size: const Size(15, 15), painter: KDAShapePainter()),
          Text(kda, style: Theme.of(context).textTheme.bodyMedium),
        ];

        List<Widget> creepsWidgets = [
          CustomPaint(size: const Size(15, 15), painter: CreepShapePainter()),
          Text(participantStats.creepScore.toString(), style: Theme.of(context).textTheme.bodyMedium),
        ];

        List<Widget> goldWidgets = [
          CustomPaint(size: const Size(15, 15), painter: GoldShapePainter()),
          Text("${(participantStats.totalGold / 1000).toStringAsFixed(1)}K", style: Theme.of(context).textTheme.bodyMedium),
        ];

        List<Expanded> widgets = [
          Expanded(
              flex: 4,
              child:SizedBox(
                width: 65,
                height: 65,
                child: getStack(participantMetadata, participantStats, 65)
              )
          ),
          Expanded(
              flex: 6,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: isBlue ? MainAxisAlignment.start : MainAxisAlignment.end,
                    children: isBlue ? kdaWidgets : kdaWidgets.reversed.toList(),
                  ),
                  Row(
                    mainAxisAlignment: isBlue ? MainAxisAlignment.start : MainAxisAlignment.end,
                    children: isBlue ? creepsWidgets : creepsWidgets.reversed.toList(),
                  ),
                  Row(
                    mainAxisAlignment: isBlue ? MainAxisAlignment.start : MainAxisAlignment.end,
                    children: isBlue ? goldWidgets : goldWidgets.reversed.toList(),
                  ),
                ],
              )
          )
        ];

        return Column(
          children: [
            Text(participantName, style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: isBlue ? widgets : widgets.reversed.toList(),
            ),
          ]
        );
      }).toList(),
    );
  }

  Stack getStack(ParticipantMetadata participantMetadata, Participant participantStats, double size){
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: ImageNetwork(
            image: Constants.getChampionIcon(participantMetadata.championId),
            width: size,
            height: size,
            fitAndroidIos: BoxFit.cover,
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size),
              border: Border.all(
                color: const Color.fromRGBO(0, 200, 200, .75),
                width: 5.0,
              ),
            ),
          ),
        ),
        Positioned(
          right: size / 15,
          bottom: size / 15,
          child: Container(
            color: Colors.black,
            width: size / 3,
            height: size / 3,
            child: Text(participantStats.level.toString()),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: size / 2.25,
            height: size / 2.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size),
              border: Border.all(
                color: const Color.fromRGBO(0, 200, 200, .75),
                width: 4.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column getGameStats(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
        getTeamsInfo(),
        getDragons(),
        getGold(),
        getObjectiveStats(),
      ],
    );
  }

  Row getTeamsInfo(){
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: ImageNetwork(
              image: eBlueTeam.image,
              height: 70,
              width: 70,
              fitAndroidIos: BoxFit.contain,
            )
        ),
        Expanded(
            flex: 4,
            child: Column(
              children: [
                Text("${eBlueTeam.code} vs ${eRedTeam.code}", style: Theme.of(context).textTheme.titleMedium),
                Text("game $gameNumber", style: Theme.of(context).textTheme.bodyMedium)
              ],
            )
        ),
        Expanded(
            flex: 3,
            child: ImageNetwork(
              image: eRedTeam.image,
              height: 70,
              width: 70,
              fitAndroidIos: BoxFit.contain,
            )
        ),
      ],
    );
  }

  Row getDragons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
            children: mBlueTeam.dragons.isNotEmpty ? mBlueTeam.dragons.map(getDragonPaint).toList() : [],
        ),
        Row(
            children:mRedTeam.dragons.isNotEmpty ? mRedTeam.dragons.map(getDragonPaint).toList() : []
        )
      ]
    );
  }

  double convertToFractionOfOne(int number) {
    int numberOfDigits = number.toString().length;
    double result = number / (math.pow(10, numberOfDigits));
    return result;
  }

  Row getGold(){
    int totalGold = mBlueTeam.totalGold + mRedTeam.totalGold;

    double blueTeamGoldPercentage = ((mBlueTeam.totalGold * 100) / totalGold);
    double redTeamGoldPercentage = (100 - blueTeamGoldPercentage);

    return Row(
      children: [
        Expanded(
            flex: blueTeamGoldPercentage.round(),
            child: Container(
              height: 20,
              color: Colors.blueAccent,
              child: Text(
                mBlueTeam.totalGold.toString(),
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.start,
              ),
            )
        ),
        Expanded(
            flex: redTeamGoldPercentage.round(),
            child: Container(
              height: 20,
              color: Colors.redAccent,
              child: Text(
                mRedTeam.totalGold.toString(),
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.end,
              ),
            )
        )
      ],
    );
  }

  Row getObjectiveStats(){
    List<String> objectives = ["inhibitor", "baron", "towers", "kills"];
    return Row(
      children: [
        Expanded(
            child: Row(
                children: objectives.map((objective) => getColumnFor(objective, mBlueTeam, true)).toList(),
            )
        ),
        Expanded(
            child: Row(
              children: objectives.reversed.map((objective) => getColumnFor(objective, mRedTeam, false)).toList(),
            )
        )
      ]
    );
  }

  Expanded getColumnFor(String objective, Team team, bool isBlue){
    Tuple2<BaseShapePainter, String> objectiveTuple = Constants.getObjectivePainterAndCount(objective, team, isBlue);

    return Expanded(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: CustomPaint(
                  size: const Size(26, 26),
                  painter: objectiveTuple.item1
              )
          ),
          Text(
            objectiveTuple.item2,
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }

  CustomPaint getDragonPaint(Dragon dragon){
    return CustomPaint(size: const Size(25, 25), painter: Constants.getDragonPainter(dragon));
  }
}