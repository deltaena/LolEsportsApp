import 'dart:convert';

GameDetails getGameDetailsFromJson(String str) => GameDetails.fromJson(json.decode(str));

class GameDetails {
  final int esportsGameId;
  final int esportsMatchId;
  final GameMetadata gameMetadata;
  final List<Frame> frames;

  GameDetails({
    required this.esportsGameId,
    required this.esportsMatchId,
    required this.gameMetadata,
    required this.frames,
  });

  factory GameDetails.fromJson(Map<String, dynamic> json) => GameDetails(
    esportsGameId: int.parse(json["esportsGameId"]),
    esportsMatchId: int.parse(json["esportsMatchId"]),
    gameMetadata: GameMetadata.fromJson(json["gameMetadata"]),
    frames: List<Frame>.from(json["frames"].map((x) => Frame.fromJson(x))),
  );

}

class Frame {
  final DateTime rfc460Timestamp;
  final GameState gameState;
  final Team blueTeam;
  final Team redTeam;

  Frame({
    required this.rfc460Timestamp,
    required this.gameState,
    required this.blueTeam,
    required this.redTeam,
  });

  factory Frame.fromJson(Map<String, dynamic> json) => Frame(
    rfc460Timestamp: DateTime.parse(json["rfc460Timestamp"]),
    gameState: gameStateValues.map[json["gameState"]]!,
    blueTeam: Team.fromJson(json["blueTeam"], true),
    redTeam: Team.fromJson(json["redTeam"], false),
  );

}

class Team {
  final bool isBlue;

  final int totalGold;
  final int inhibitors;
  final int towers;
  final int barons;
  final int totalKills;
  final List<Dragon> dragons;
  final List<Participant> participants;

  Team({
    required this.isBlue,
    required this.totalGold,
    required this.inhibitors,
    required this.towers,
    required this.barons,
    required this.totalKills,
    required this.dragons,
    required this.participants,
  });

  factory Team.fromJson(Map<String, dynamic> json, bool isBlue) => Team(
    isBlue: isBlue,
    totalGold: json["totalGold"],
    inhibitors: json["inhibitors"],
    towers: json["towers"],
    barons: json["barons"],
    totalKills: json["totalKills"],
    dragons: List<Dragon>.from(json["dragons"].map((x) => dragonValues.map[x])),
    participants: List<Participant>.from(json["participants"].map((x) => Participant.fromJson(x))),
  );

  Participant getParticipant(int id){
    return participants.where((participant) => participant.participantId == id).first;
  }
}

enum Dragon {
  mountain,
  chemtech,
  infernal,
  hextech,
  ocean,
  cloud,
  elder
}

final dragonValues = EnumValues({
  "mountain": Dragon.mountain,
  "chemtech": Dragon.chemtech,
  "infernal": Dragon.infernal,
  "hextech": Dragon.hextech,
  "ocean": Dragon.ocean,
  "cloud": Dragon.cloud,
  "elder": Dragon.elder
});

class Participant {
  final int participantId;
  final int totalGold;
  final int level;
  final int kills;
  final int deaths;
  final int assists;
  final int creepScore;
  final int currentHealth;
  final int maxHealth;

  Participant({
    required this.participantId,
    required this.totalGold,
    required this.level,
    required this.kills,
    required this.deaths,
    required this.assists,
    required this.creepScore,
    required this.currentHealth,
    required this.maxHealth,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
    participantId: json["participantId"],
    totalGold: json["totalGold"],
    level: json["level"],
    kills: json["kills"],
    deaths: json["deaths"],
    assists: json["assists"],
    creepScore: json["creepScore"],
    currentHealth: json["currentHealth"],
    maxHealth: json["maxHealth"],
  );

  String getKda() => "$kills/$deaths/$assists";
  String getCs() => creepScore.toString();
  String getGold() => "${(totalGold / 1000).toStringAsFixed(1)}K";
}

enum GameState {
  inGame,
  finished
}

final gameStateValues = EnumValues({
  "in_game": GameState.inGame,
  "finished": GameState.finished
});

class GameMetadata {
  final String patchVersion;
  final TeamMetadata blueTeamMetadata;
  final TeamMetadata redTeamMetadata;

  GameMetadata({
    required this.patchVersion,
    required this.blueTeamMetadata,
    required this.redTeamMetadata,
  });

  factory GameMetadata.fromJson(Map<String, dynamic> json) => GameMetadata(
    patchVersion: json["patchVersion"],
    blueTeamMetadata: TeamMetadata.fromJson(json["blueTeamMetadata"]),
    redTeamMetadata: TeamMetadata.fromJson(json["redTeamMetadata"]),
  );

}

class TeamMetadata {
  final int esportsTeamId;
  final List<ParticipantMetadata> participantMetadata;

  TeamMetadata({
    required this.esportsTeamId,
    required this.participantMetadata,
  });

  factory TeamMetadata.fromJson(Map<String, dynamic> json) => TeamMetadata(
    esportsTeamId: int.parse(json["esportsTeamId"]),
    participantMetadata: List<ParticipantMetadata>.from(json["participantMetadata"].map((x) => ParticipantMetadata.fromJson(x))),
  );

  ParticipantMetadata getParticipant(Role role){
    return participantMetadata.where((participantMeta) => participantMeta.role == role.name).first;
  }
}

enum Role {
  top,
  jungle,
  mid,
  bottom,
  support
}

class ParticipantMetadata {
  final int participantId;
  final String esportsPlayerId;
  final String summonerName;
  final String championId;
  final String role;

  ParticipantMetadata({
    required this.participantId,
    required this.esportsPlayerId,
    required this.summonerName,
    required this.championId,
    required this.role,
  });

  factory ParticipantMetadata.fromJson(Map<String, dynamic> json) => ParticipantMetadata(
    participantId: json["participantId"],
    esportsPlayerId: json["esportsPlayerId"],
    summonerName: json["summonerName"],
    championId: json["championId"],
    role: json["role"],
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
