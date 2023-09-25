import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views/shapes/icons/app_icon_painter.dart';
import '../game_details/bloc.dart';
import '../../services/lolesports_service.dart';

import 'package:lol_esports/modules/schedule/lib.dart' as schedule;

import 'carousel_container_bloc_builder.dart';
import 'bloc.dart';

class Page extends StatelessWidget {
  final schedule.SummonersEvent summonersEvent;

  const Page(this.summonersEvent, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => EDBloc(LolesportsService.getInstance())),
        BlocProvider(
            create: (_) => GDBloc(LolesportsService.getInstance()))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: CustomPaint(size: const Size(60, 60), painter: AppIconPainter(Colors.white)),
        ),
        body: CarouselContainerBlocBuilder(summonersEvent),
      )
    );
  }
}