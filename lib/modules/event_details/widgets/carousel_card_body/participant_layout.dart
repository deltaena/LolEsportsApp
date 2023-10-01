import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_esports/modules/event_details/widgets/carousel_card_body/participant_icon.dart';
import 'package:lol_esports/modules/game_details/lib.dart';
import 'package:lol_esports/views/shapes/stats/creep_shape_painter.dart';
import 'package:lol_esports/views/shapes/stats/gold_shape_painter.dart';
import 'package:lol_esports/views/shapes/stats/kda_shape_painter.dart';

class ParticipantLayout extends StatelessWidget {

  final Size iconSize = Size(15.h, 15.h);

  final ParticipantMetadata metadata;
  final Participant stats;

  late final bool isBlue;

  static late BuildContext context;

  ParticipantLayout(this.metadata, this.stats, {super.key}) {
    isBlue = metadata.participantId < 6;
  }

  @override
  Widget build(BuildContext context) {
    ParticipantLayout.context = context;

    List<Widget> widgets = [getParticipantIcon(), getParticipantStats()];
    if(!isBlue) widgets = widgets.reversed.toList();

    return Column(
        children: [
          getParticipantName(),
          Row(
            children: widgets,
          ),
        ]
    );
  }

  Text getParticipantName() => Text(metadata.summonerName, style: Theme.of(context).textTheme.titleMedium);

  Expanded getParticipantIcon(){
    return Expanded(
        flex: 4,
        child: ParticipantIcon(metadata, stats)
    );
  }

  Expanded getParticipantStats(){
    return Expanded(
        flex: 6,
        child: Column(
          children: [
            getKdaRow(),
            getCsRow(),
            getGoldRow()
          ],
        )
    );
  }

  Row getKdaRow() => basicRow(KDAShapePainter(), stats.getKda());
  Row getCsRow() => basicRow(CreepShapePainter(), stats.getCs());
  Row getGoldRow() => basicRow(GoldShapePainter(), stats.getGold());

  Row basicRow(CustomPainter painter, String text){
    return Row(
        mainAxisAlignment: isBlue ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: basicPaintAndText(painter, text)
    );
  }

  List<Widget> basicPaintAndText(CustomPainter painter, String text){
    List<Widget> widgets = [
      CustomPaint(size: iconSize, painter: painter),
      Text(text, style: Theme.of(context).textTheme.bodySmall)
    ];

    return isBlue ? widgets : widgets.reversed.toList();
  }
}