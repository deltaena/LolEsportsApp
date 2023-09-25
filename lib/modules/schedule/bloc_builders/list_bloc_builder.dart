import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_esports/models/basic_bloc_builder.dart';
import 'package:lol_esports/models/basic_state.dart';

import 'package:lol_esports/modules/schedule/widgets/list_element.dart';

import '../../../models/basic_event.dart';
import '../../../views/loader.dart';
import '../lib.dart' as schedule;

class ListBlocBuilder extends BaseBlocBuilder {

  const ListBlocBuilder({super.key});

  @override
  Bloc<BasicEvent, BasicState> getBloc(BuildContext context) {
    return context.read<schedule.SBloc>();
  }

  @override
  Widget onNotStarted(BuildContext context) {
    getBloc(context).add(Requested({ "leaguesIds": List<int>.empty() }));
    return const Loader();
  }

  @override
  Widget onOk(OkArgs okArgs) => getListView((okArgs.results["schedules"] as schedule.Schedule).events);

  @override
  Widget onUpdated(OkArgs okArgs) => getListView((okArgs.results["schedules"] as schedule.Schedule).events);

  ListView getListView(List<schedule.Event> events){
    events = events.reversed.toList();

    return  ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        return ListElement(event: events[index]);
      },
    );
  }
}


























