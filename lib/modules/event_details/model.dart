import 'dart:convert';

GetEventDetails getEventDetailsFromJson(String str) => GetEventDetails.fromJson(json.decode(str));

class GetEventDetails {
  final Data data;

  GetEventDetails({
    required this.data,
  });

  factory GetEventDetails.fromJson(Map<String, dynamic> json) => GetEventDetails(
    data: Data.fromJson(json["data"]),
  );

}

class Data {
  final EventDetails event;

  Data({
    required this.event,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    event: EventDetails.fromJson(json["event"]),
  );
}

class EventDetails {
  final int id;
  final String type;
  final Tournament tournament;
  final League league;
  final Match match;
  final List<Stream> streams;

  EventDetails({
    required this.id,
    required this.type,
    required this.tournament,
    required this.league,
    required this.match,
    required this.streams,
  });

  factory EventDetails.fromJson(Map<String, dynamic> json) => EventDetails(
    id: int.parse(json["id"]),
    type: json["type"],
    tournament: Tournament.fromJson(json["tournament"]),
    league: League.fromJson(json["league"]),
    match: Match.fromJson(json["match"]),
    streams: List<Stream>.from(json["streams"].map((x) => Stream.fromJson(x))),
  );

}

class League {
  final String id;
  final String slug;
  final String image;
  final String name;

  League({
    required this.id,
    required this.slug,
    required this.image,
    required this.name,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: json["id"],
    slug: json["slug"],
    image: json["image"],
    name: json["name"],
  );
}

class Match {
  final Strategy strategy;
  final List<MatchTeam> teams;
  final List<Game> games;

  Match({
    required this.strategy,
    required this.teams,
    required this.games,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    strategy: Strategy.fromJson(json["strategy"]),
    teams: List<MatchTeam>.from(json["teams"].map((x) => MatchTeam.fromJson(x))),
    games: List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
  );
}

class Game {
  final int number;
  final int id;
  final String state;
  final List<GameTeam> teams;
  final List<dynamic> vods;

  Game({
    required this.number,
    required this.id,
    required this.state,
    required this.teams,
    required this.vods,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
    number: json["number"],
    id: int.parse(json["id"]),
    state: json["state"],
    teams: List<GameTeam>.from(json["teams"].map((x) => GameTeam.fromJson(x))),
    vods: List<dynamic>.from(json["vods"].map((x) => x)),
  );
}

class GameTeam {
  final String id;
  final Side side;

  GameTeam({
    required this.id,
    required this.side,
  });

  factory GameTeam.fromJson(Map<String, dynamic> json) => GameTeam(
    id: json["id"],
    side: sideValues.map[json["side"]]!,
  );
}

enum Side {
  BLUE,
  RED
}

final sideValues = EnumValues({
  "blue": Side.BLUE,
  "red": Side.RED
});

class Strategy {
  final int count;

  Strategy({
    required this.count,
  });

  factory Strategy.fromJson(Map<String, dynamic> json) => Strategy(
    count: json["count"],
  );
}

class MatchTeam {
  final int id;
  final String name;
  final String code;
  final String image;
  final Result result;

  MatchTeam({
    required this.id,
    required this.name,
    required this.code,
    required this.image,
    required this.result,
  });

  factory MatchTeam.fromJson(Map<String, dynamic> json) => MatchTeam(
    id: int.parse(json["id"]),
    name: json["name"],
    code: json["code"],
    image: json["image"],
    result: Result.fromJson(json["result"]),
  );
}

class Result {
  final int gameWins;

  Result({
    required this.gameWins,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    gameWins: json["gameWins"],
  );
}

class Stream {
  final String parameter;
  final String locale;
  final MediaLocale mediaLocale;
  final Provider provider;
  final List<String> countries;
  final int offset;
  final StatsStatus statsStatus;

  Stream({
    required this.parameter,
    required this.locale,
    required this.mediaLocale,
    required this.provider,
    required this.countries,
    required this.offset,
    required this.statsStatus,
  });

  factory Stream.fromJson(Map<String, dynamic> json) => Stream(
    parameter: json["parameter"],
    locale: json["locale"],
    mediaLocale: MediaLocale.fromJson(json["mediaLocale"]),
    provider: providerValues.map[json["provider"]]!,
    countries: List<String>.from(json["countries"].map((x) => x)),
    offset: json["offset"],
    statsStatus: statsStatusValues.map[json["statsStatus"]]!,
  );
}

class MediaLocale {
  final String locale;
  final String englishName;
  final String translatedName;

  MediaLocale({
    required this.locale,
    required this.englishName,
    required this.translatedName,
  });

  factory MediaLocale.fromJson(Map<String, dynamic> json) => MediaLocale(
    locale: json["locale"],
    englishName: json["englishName"],
    translatedName: json["translatedName"],
  );
}

enum Provider {
  TWITCH,
  YOUTUBE
}

final providerValues = EnumValues({
  "twitch": Provider.TWITCH,
  "youtube": Provider.YOUTUBE
});

enum StatsStatus {
  ENABLED
}

final statsStatusValues = EnumValues({
  "enabled": StatsStatus.ENABLED
});

class Tournament {
  final String id;

  Tournament({
    required this.id,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
    id: json["id"],
  );
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
