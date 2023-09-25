import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:intl/intl.dart';

import '../model.dart' as model;

class SummonersEventWidget extends StatelessWidget {

  final double eventLayoutHeight = 90;

  final int teamLogoFlex = 4;
  final int eventNameAndStateFlex = 5;

  final double teamLogoSize = 60;


  final model.SummonersEvent event;
  bool isLive (model.SummonersEvent event) => (event.state == model.State.inProgress);

  static late BuildContext context;

  const SummonersEventWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    SummonersEventWidget.context = context;

    return getEventStructure();
  }

  SizedBox getEventStructure(){
    return SizedBox(
        height: eventLayoutHeight,
        child: GestureDetector(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: teamLogoFlex,
                      child: getBlueTeamLogo(),
                    ),
                    Expanded(
                        flex: eventNameAndStateFlex,
                        child: getEventNameAndState()
                    ),
                    Expanded(
                      flex: teamLogoFlex,
                      child: getRedTeamLogo(),
                    ),
                  ],
                ),
                getEventDetails()
              ],
            )
        )
    );
  }

  Column getEventNameAndState(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          event.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          isLive(event) ? "now playing" : formatDate(event.startTime),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  ImageNetwork getBlueTeamLogo () => getImageNetwork((event.match.teams[0].image));
  ImageNetwork getRedTeamLogo () => getImageNetwork((event.match.teams[1].image));

  Text getEventDetails(){
    return Text(
      "${event.league.name}: ${event.blockName} bo: ${event.match.strategy.count}",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  ImageNetwork getImageNetwork(String url){
    return ImageNetwork(
        image: url,
        fitAndroidIos: BoxFit.contain,
        height: teamLogoSize,
        width: teamLogoSize
    );
  }

  String formatDate(DateTime date){
    return DateFormat("yy-MM-dd HH:mm").format(date);
  }
}