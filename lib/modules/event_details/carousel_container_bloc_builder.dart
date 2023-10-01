import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_esports/modules/game_details/carousel_bloc_builder.dart';

import '../../models/basic_bloc_builder.dart';
import '../../models/basic_event.dart';
import '../../models/basic_state.dart';
import '../../views/loader.dart';

import 'bloc.dart';
import 'model.dart';

import 'package:lol_esports/modules/schedule/lib.dart' as schedule;

class CarouselContainerBlocBuilder extends BaseBlocBuilder {
  final schedule.SummonersEvent summonersEvent;

  const CarouselContainerBlocBuilder(this.summonersEvent, {super.key});

  @override
  Bloc<BasicEvent, BasicState> getBloc(BuildContext context) {
    return context.read<EDBloc>();
  }

  @override
  Widget onNotStarted(BuildContext context) {
    getBloc(context).add(Requested({ "event": summonersEvent }));
    return Loader();
  }

  @override
  Widget onOk(OkArgs okArgs) {
    Match match = okArgs.results["event_details"].data.event.match;
    return CarouselBlocBuilder(summonersEvent, match);
  }
}