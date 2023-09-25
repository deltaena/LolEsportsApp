import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import '../model.dart' as models;

class BasicEventWidget extends StatelessWidget {

  final double basicEventHeight = 70;

  final int basicEventLeagueImageFlex = 7;
  final int basicEventLeagueNameFlex = 3;

  final double eventLeagueImageSize = 60;


  final models.BasicEvent basicEvent;

  static late BuildContext context;

  const BasicEventWidget({super.key, required this.basicEvent});

  @override
  Widget build(BuildContext context) {
    BasicEventWidget.context = context;

    return getStructure();
  }

  SizedBox getStructure(){
    return SizedBox(
        height: basicEventHeight,
        child: Column(
          children: [
            Expanded(
                flex: basicEventLeagueImageFlex,
                child: getEventLeagueImage(basicEvent.league.image!)
            ),
            Expanded(
                flex: basicEventLeagueNameFlex,
                child: getLeagueName()
            ),
          ],
        )
    );
  }

  ImageNetwork getEventLeagueImage(String url){
    return ImageNetwork(
        image: url,
        fitAndroidIos: BoxFit.contain,
        height: eventLeagueImageSize,
        width: eventLeagueImageSize
    );
  }

  Text getLeagueName(){
    return Text(
      basicEvent.league.name,
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.center,
    );
  }
}