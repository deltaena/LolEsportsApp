import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_esports/modules/leagues_view/league_selected_indicator_bloc_builder.dart';

import 'package:lol_esports/modules/leagues_view/lib.dart';
import 'package:lol_esports/modules/leagues_fetch/lib.dart' as lf;

class ListElement extends StatelessWidget {

  final double leagueElementHeight = 80.h;

  final int leagueIconFlex = 4;
  final int leagueNameFlex = 15;
  final int leagueNameSelectedIndicatorFlex = 1;


  final lf.League league;

  ListElement(this.league, {super.key});

  static late BuildContext context;

  @override
  Widget build(BuildContext context) {
    ListElement.context = context;

    return  GestureDetector(
      child: leagueCardStructure(),
      onTap: () => {
        league.toggleSelection(),

        context.read<LVBloc>().add(Select(league))
      },
    );
  }

  SizedBox leagueCardStructure(){
    return SizedBox(
      height: leagueElementHeight,
      child: Row(
          children: [
            Expanded(
                flex: leagueIconFlex,
                child: getLeagueIcon()
            ),
            Expanded(
                flex: leagueNameFlex,
                child: leagueName()
            ),
            Expanded(
                flex: leagueNameSelectedIndicatorFlex,
                child: LeagueSelectorIndicatorBlocBuilder(league)
            ),
          ]),
    );
  }

  Image getLeagueIcon(){
    return Image.network(
      league.image,
      fit: BoxFit.contain,
    );
  }

  Text leagueName(){
    return Text(
        league.name,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium
    );
  }
}


















