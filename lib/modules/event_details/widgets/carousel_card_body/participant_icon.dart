import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_network/image_network.dart';
import 'package:lol_esports/models/constants.dart';
import 'package:lol_esports/modules/game_details/lib.dart';

class ParticipantIcon extends StatelessWidget {

  final double imageSize = 65.h;

  final ParticipantMetadata metadata;
  final Participant stats;

  static late BuildContext context;

  ParticipantIcon(this.metadata, this.stats, {super.key});

  @override
  Widget build(BuildContext context) {
    ParticipantIcon.context = context;

    return Stack(
        children: [
          getChampionImage(),
          getChampionBorder(),
          getChampionLevel()
        ]
    );
  }

  ImageNetwork getChampionImage(){
    return ImageNetwork(
      image: Constants.getChampionIcon(metadata.championId),
      width: imageSize,
      height: imageSize,
      fitAndroidIos: BoxFit.cover,
      borderRadius: BorderRadius.circular(imageSize),
    );
  }
  Positioned getChampionBorder() {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        width: imageSize,
        height: imageSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(imageSize),
          border: Border.all(
            color: const Color.fromRGBO(0, 200, 200, .75),
            width: 5.h,
          ),
        ),
      ),
    );
  }

  Positioned getChampionLevel() {
    return Positioned(
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(0, 200, 200, .75), width: 4.h),
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        width: 28.h,
        height: 28.h,
        alignment: Alignment.center,
        child: Text(stats.level.toString(), style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
      ),
    );
  }
}
/*
Container(
    decoration: new BoxDecoration(
        gradient: new LinearGradient(
            stops: [0.02, 0.02],
            colors: [Colors.red, Colors.white]
        ),
    borderRadius: new BorderRadius.all(const Radius.circular(6.0))))


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: ,
        ),


        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 30.w,
            height: 30.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(65.w),
              border: Border.all(
                color: const Color.fromRGBO(0, 200, 200, .75),
                width: 4.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
 */
