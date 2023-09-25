import 'package:flutter/material.dart';

import 'package:lol_esports/modules/event_details/lib.dart' as event_details;
import 'package:lol_esports/modules/schedule/lib.dart' as schedule;
import 'package:lol_esports/modules/schedule/widgets/basic_event_widget.dart';
import 'package:lol_esports/modules/schedule/widgets/summoners_event_widget.dart';


class ListElement extends StatelessWidget {
  final schedule.Event event;

  const ListElement({super.key, required this.event});

  static late BuildContext context;

  @override
  Widget build(BuildContext context) {
    ListElement.context = context;

    return event is schedule.SummonersEvent ? getSummonerEvent() : getBasicEvent();
  }

  GestureDetector getSummonerEvent(){
    return GestureDetector(
        child: SummonersEventWidget(event: event as schedule.SummonersEvent),
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => event_details.Page(event as schedule.SummonersEvent))
        )
    );
  }

  GestureDetector getBasicEvent(){;
    return GestureDetector(
      child: BasicEventWidget(basicEvent: event as schedule.BasicEvent),
      onTap: () => {}//TODO add something to indicate that this cannot be navigated,
    );
  }
}






















