import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_esports/modules/event_details/widgets/carousel_card_body/participant_layout.dart';

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