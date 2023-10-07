import 'dart:convert';

import 'package:flutter/cupertino.dart';

Schedule getSchedulesFromJson(String str) => GetSchedule.fromJson(json.decode(str)).data.schedule;

class GetSchedule {
  final Data data;

  GetSchedule({
    required this.data,
  });

  factory GetSchedule.fromJson(Map<String, dynamic> json) => GetSchedule(
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final Schedule schedule;

  Data({
    required this.schedule,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    schedule: Schedule.fromJson(json["schedule"]),
  );
}

class Schedule {
  final Pages pages;
  final List<Event> events;

  Schedule({
    required this.pages,
    required this.events,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    pages: Pages.fromJson(json["pages"]),
    events: List<Event>.from(json["events"].map(
            (x) => x["type"] == "match" ? SummonersEvent.fromJson(x) : BasicEvent.fromJson(x))
    )
  );
}

abstract class Event {
  final DateTime startTime;
  final State state;
  final String type;
  final League league;

  Event({
    required this.startTime,
    required this.state,
    required this.type,
    required this.league,
  });
}

class SummonersEvent extends Event {
  final String? blockName;
  final Match match;
  late final DateTime endingTime;

  SummonersEvent(this.blockName, this.match, {
    required super.startTime,
    required super.state,
    required super.type,
    required super.league
  }){
    endingTime = startTime.add(Duration(hours: match.strategy.count + 1));
  }

  factory SummonersEvent.fromJson(Map<String, dynamic> json) => SummonersEvent(
    json["blockName"],
    Match.fromJson(json["match"]),
    startTime: DateTime.parse(json["startTime"]).toUtc().toLocal(),
    state: stateValues.map[json["state"]]!,
    type: json["type"]!,
    league: League.fromJson(json["league"]),
  );

  @override
  String toString() {
    return "${getTeamString(match.teams[0], false)} vs ${getTeamString(match.teams[1], true)}";
  }

  String getTeamString(Team team, bool mirror){
    String teamName = team.code;
    String teamResult = "";

    if(state != State.unstarted) teamResult = "${team.result?.gameWins}";

    return mirror ? "$teamResult $teamName" : "$teamName $teamResult";
  }
}

class BasicEvent extends Event {
  BasicEvent({
    required super.startTime,
    required super.state,
    required super.type,
    required super.league
  });

  factory BasicEvent.fromJson(Map<String, dynamic> json) => BasicEvent(
    startTime: DateTime.parse(json["startTime"]),
    state: stateValues.map[json["state"]]!,
    type: json["type"]!,
    league: League.fromJson(json["league"]),
  );
}

enum State {
  completed,
  inProgress,
  unstarted,
}

final stateValues = EnumValues({
  "completed": State.completed,
  "inProgress": State.inProgress,
  "unstarted": State.unstarted,
});

class League {
  final String name;
  final String slug;
  final String? image;

  League({
    required this.name,
    required this.slug,
    required this.image
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
    name: json["name"],
    slug: json["slug"],
    image: json["image"]
  );
}

class Match {
  final int id;
  final List<Flag> flags;
  final List<Team> teams;
  final Strategy strategy;

  Match({
    required this.id,
    required this.flags,
    required this.teams,
    required this.strategy,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    id: int.parse(json["id"]),
    flags: List<Flag>.from(json["flags"].map((x) => flagValues.map[x])),
    teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
    strategy: Strategy.fromJson(json["strategy"]),
  );

}

enum Flag {
  hasVod,
  isSpoiler
}

final flagValues = EnumValues({
  "hasVod": Flag.hasVod,
  "isSpoiler": Flag.isSpoiler,
});

class Strategy {
  final String type;
  final int count;

  Strategy({
    required this.type,
    required this.count,
  });

  factory Strategy.fromJson(Map<String, dynamic> json) => Strategy(
    type: json["type"]!,
    count: json["count"],
  );

  @override
  String toString() {
    return '$type: $count';
  }
}

class Team {
  final String name;
  final String code;
  final String image;
  final Result? result;
  final Record? record;

  Team({
    required this.name,
    required this.code,
    required this.image,
    required this.result,
    required this.record,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    name: json["name"],
    code: json["code"],
    image: json["image"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
    record: json["record"] == null ? null : Record.fromJson(json["record"]),
  );
}

class Record {
  final int wins;
  final int losses;

  Record({
    required this.wins,
    required this.losses,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    wins: json["wins"],
    losses: json["losses"],
  );

  Map<String, dynamic> toJson() => {
    "wins": wins,
    "losses": losses,
  };
}

class Result {
  final Outcome outcome;
  final int gameWins;

  Result({
    required this.outcome,
    required this.gameWins,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    outcome: json["outcome"] == null ? Outcome.notPlayed : outcomeValues.map[json["outcome"]]!,
    gameWins: json["gameWins"],
  );
}

enum Outcome {
  win,
  loss,
  notPlayed
}

final outcomeValues = EnumValues({
  "win": Outcome.win,
  "loss": Outcome.loss
});

class Pages {
  final String? older;
  final dynamic newer;

  Pages({
    required this.older,
    required this.newer,
  });

  factory Pages.fromJson(Map<String, dynamic> json) => Pages(
    older: json["older"],
    newer: json["newer"],
  );

  Map<String, dynamic> toJson() => {
    "older": older,
    "newer": newer,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
