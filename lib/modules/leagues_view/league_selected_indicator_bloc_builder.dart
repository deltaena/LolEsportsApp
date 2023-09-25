import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_esports/models/basic_bloc_builder.dart';
import 'package:lol_esports/models/basic_event.dart';
import 'package:lol_esports/models/basic_state.dart';
import 'package:lol_esports/modules/leagues_view/bloc.dart';

import '../event_details/model.dart';
import '../leagues_fetch/model.dart';

import 'package:lol_esports/modules/leagues_fetch/lib.dart' as lf;


class LeagueSelectorIndicatorBlocBuilder extends BaseBlocBuilder {

  final lf.League currentLeague;

  const LeagueSelectorIndicatorBlocBuilder(this.currentLeague, {super.key});

  @override
  Bloc<BasicEvent, BasicState> getBloc(BuildContext context) {
    return context.read<LVBloc>();
  }

  @override
  Widget onNotStarted(BuildContext context) {
    return getSelectorIndicator(currentLeague.isSelected);
  }

  @override
  Widget onSelected(OkArgs okArgs) {
    lf.League newLeague = okArgs.results["league"];

    if(newLeague.id == currentLeague.id) {
      currentLeague.isSelected = newLeague.isSelected;

      print("${newLeague.name} selected now is ${newLeague.isSelected}");
    }

    return getSelectorIndicator(currentLeague.isSelected);
  }

  FractionallySizedBox getSelectorIndicator(bool selected){
    return FractionallySizedBox(
        heightFactor: 1,
        child: Container(
            decoration: BoxDecoration(color: selected ? Colors.lightBlueAccent : Colors.white)
        )
    );
  }

}