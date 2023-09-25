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
    return const Loader();
  }

  @override
  Widget onOk(OkArgs okArgs) {
    Match match = okArgs.results["event_details"].data.event.match;
    return CarouselBlocBuilder(summonersEvent, match);
  }
}

/*
class CarouselContainerBlocBuilder extends StatelessWidget {
  final schedule.SummonersEvent summonersEvent;

  const CarouselContainerBlocBuilder(this.summonersEvent, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EDBloc, States>(
        builder: (context, state) {
          if(state is NotStarted) {
            context.read<Bloc>().add(Requested(summonersEvent));
            return const Text("initializing");
          }

          if(state is Started) return Loader();

          if(state is Ko) {
            return Text(
              "something went wrong ${state.code}: ${state.message}",
              style: const TextStyle(color: Colors.white),
            );
          }

          Match match = (state as Ok).getEventDetails.data.event.match;
            
          return CarouselBlocBuilder(summonersEvent, match);
        }
    );
  }
}
*/