import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_esports/models/basic_state.dart';

import 'package:lol_esports/modules/event_details/model.dart' as ed;
import 'package:lol_esports/modules/schedule/lib.dart' as schedule;

import '../../models/basic_bloc_builder.dart';
import '../../models/basic_event.dart';

import 'bloc.dart';
import 'model.dart';
import 'carousel_card.dart';

import '../../views/loader.dart';

class CarouselBlocBuilder extends BaseBlocBuilder {
  final schedule.SummonersEvent summonersEvent;
  final ed.Match eMatch;

  const CarouselBlocBuilder(this.summonersEvent, this.eMatch, {super.key});

  @override
  Bloc<BasicEvent, BasicState> getBloc(BuildContext context) { return context.read<GDBloc>(); }

  @override
  Widget onNotStarted(BuildContext context) {
    getBloc(context).add(Requested({
      "matchIds": eMatch.games.map((game) => game.id).toList(),
      "endingTime": summonersEvent.endingTime
    }));

    return const Loader();
  }

  @override
  Widget onOk(OkArgs okArgs) {
    List<GameDetails> gamesDetails = okArgs.results["gamesDetails"];

    return CarouselSlider(
      options: CarouselOptions(
          height: double.maxFinite,
          enableInfiniteScroll: false,
          enlargeCenterPage: true
      ),
      items: gamesDetails.map((matchDetails) => CarouselCard(eMatch, matchDetails)).toList(),
    );
  }
}

/*
class CarouselBlocBuilder extends StatelessWidget {
  final schedule.SummonersEvent summonersEvent;
  final ed.Match eMatch;

  const CarouselBlocBuilder(this.summonersEvent, this.eMatch, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GDBloc, BasicState>(
        builder: (context, state) {
          if(state is NotStarted){
            context.read<GDBloc>().add(Requested({
              "matchIds": eMatch.games.map((game) => game.id).toList(),
              "endingTime": summonersEvent.endingTime
            }));

            return Loader();
          }

          if(state is Started) return Loader();

          if(state is Ko) {
            return Text(":(");
          }

          List<GameDetails> gamesDetails = (state as Ok).gamesDetails;

          return CarouselSlider(
            options: CarouselOptions(
                height: double.maxFinite,
                enableInfiniteScroll: false,
                enlargeCenterPage: true
            ),
            items: gamesDetails.map((matchDetails) => CarouselCard(eMatch, matchDetails)).toList(),
          );
    });
  }
}

 */


















