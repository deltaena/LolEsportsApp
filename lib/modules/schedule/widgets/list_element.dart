import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widgetkit/flutter_widgetkit.dart';

import 'package:lol_esports/modules/event_details/lib.dart' as event_details;
import 'package:lol_esports/modules/schedule/lib.dart' as schedule;
import 'package:lol_esports/modules/schedule/widgets/basic_event_widget.dart';
import 'package:lol_esports/modules/schedule/widgets/summoners_event_widget.dart';
import 'package:lol_esports/widget/live_event.dart';


class ListElement extends StatelessWidget {
  final schedule.Event event;
  final int index;

  const ListElement({super.key, required this.event, required this.index});

  static late BuildContext context;

  @override
  Widget build(BuildContext context) {
    ListElement.context = context;

    return event is schedule.SummonersEvent ? getSummonerEvent() : getBasicEvent();
  }

  Dismissible getSummonerEvent(){
    return Dismissible(
        key: Key("$index"),
        background: Container(color: Colors.green),
        secondaryBackground: Container(color: Colors.red),
        confirmDismiss: (direction) async {

          String eventText = "${(event as schedule.SummonersEvent).match.teams[0].name} vs ${(event as schedule.SummonersEvent).match.teams[1].name}";
          WidgetKit.setItem('event_data', jsonEncode(FlutterWidgetData(eventText)), 'group.deltaena');
          WidgetKit.reloadAllTimelines();

          return false;
        },
        child: InkWell(
            child: SummonersEventWidget(event: event as schedule.SummonersEvent),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => event_details.Page(event as schedule.SummonersEvent))),
        )
    );
  }

  GestureDetector getBasicEvent(){
    return GestureDetector(
      child: BasicEventWidget(basicEvent: event as schedule.BasicEvent),
      onTap: () => {}//TODO add something to indicate that this cannot be navigated,
    );
  }
}






















