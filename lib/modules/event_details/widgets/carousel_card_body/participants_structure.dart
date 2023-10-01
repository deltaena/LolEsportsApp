import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_esports/modules/event_details/widgets/carousel_card_body/participant_icon.dart';
import 'package:lol_esports/modules/event_details/widgets/carousel_card_body/participant_layout.dart';
import 'package:lol_esports/views/shapes/stats/stat_painters_lib.dart';

import '../../../game_details/lib.dart';

class ParticipantsStructure extends StatelessWidget {

  final Size iconSize = Size(15.h, 15.h);


  final Team blueTeam;
  final Team redTeam;

  final TeamMetadata blueMetadata;
  final TeamMetadata redMetadata;

  static late BuildContext context;

  ParticipantsStructure(this.blueTeam, this.redTeam, this.blueMetadata, this.redMetadata, {super.key});

  @override
  Widget build(BuildContext context) {
    ParticipantsStructure.context = context;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getTeamParticipants(blueMetadata, blueTeam),
        getTeamParticipants(redMetadata, redTeam)
      ],
    );
  }

  Expanded getTeamParticipants(TeamMetadata teamMetadata, Team team){
    return Expanded(
        flex: 1,
        child: Column(
          children: Role.values.map((role) {
            ParticipantMetadata metadata = teamMetadata.getParticipant(role);
            Participant stats = team.getParticipant(metadata.participantId);

            return ParticipantLayout(metadata, stats);
          }).toList(),
        )
    );
  }
}

/*

        ParticipantMetadata participantMetadata = teamMetadata.getParticipant(role);
        Participant participantStats = team.getParticipant(participantMetadata.participantId);

        String participantName = participantMetadata.summonerName;
        String kda = "${participantStats.kills}/${participantStats.deaths}/${participantStats.assists}";

        List<Widget> kdaWidgets = [
          CustomPaint(size: iconSize, painter: KDAShapePainter()),
          Text(kda, style: Theme.of(context).textTheme.bodySmall),
        ];

        List<Widget> creepsWidgets = [
          CustomPaint(size: iconSize, painter: CreepShapePainter()),
          Text(participantStats.creepScore.toString(), style: Theme.of(context).textTheme.bodySmall),
        ];

        List<Widget> goldWidgets = [
          CustomPaint(size: iconSize, painter: GoldShapePainter()),
          Text("${(participantStats.totalGold / 1000).toStringAsFixed(1)}K", style: Theme.of(context).textTheme.bodySmall),
        ];

        List<Expanded> widgets = [
          Expanded(
              flex: 4,
              child:SizedBox(
                  width: 65.w,
                  height: 65.w,
                  child: ParticipantIcon()
              )
          ),
          Expanded(
              flex: 6,
              child: Column(
                children: [
                  Container(
                    color: Colors.grey,
                    height: 20.h,
                    alignment: team.isBlue ? Alignment.centerLeft : Alignment.centerRight,
                    child: Row(children: team.isBlue ? kdaWidgets : kdaWidgets.reversed.toList()),
                  ),
                  Row(
                    mainAxisAlignment: team.isBlue ? MainAxisAlignment.start : MainAxisAlignment.end,
                    children: team.isBlue ? creepsWidgets : creepsWidgets.reversed.toList(),
                  ),
                  Row(
                    mainAxisAlignment: team.isBlue ? MainAxisAlignment.start : MainAxisAlignment.end,
                    children: team.isBlue ? goldWidgets : goldWidgets.reversed.toList(),
                  ),
                ],
              )
          )
        ];

        return Column(
            children: [
              Text(participantName, style: Theme.of(context).textTheme.titleMedium),
              Row(
                children: team.isBlue ? widgets : widgets.reversed.toList(),
              ),
            ]
        );
      }
 */