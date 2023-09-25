import 'dart:convert';

List<League> getLeaguesFromJson(String str) => GetLeagues.fromJson(json.decode(str)).data.leagues;

class GetLeagues {
  Data data;

  GetLeagues({
    required this.data,
  });

  factory GetLeagues.fromJson(Map<String, dynamic> json) => GetLeagues(
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  List<League> leagues;

  Data({
    required this.leagues,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    leagues: List<League>.from(json["leagues"].map((x) => League.fromJson(x))),
  );
}

class League {
  int id;
  String slug;
  String name;
  String region;
  String image;
  int priority;
  DisplayPriority displayPriority;
  bool isSelected = false;

  League({
    required this.id,
    required this.slug,
    required this.name,
    required this.region,
    required this.image,
    required this.priority,
    required this.displayPriority,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: int.parse(json["id"]),
    slug: json["slug"],
    name: json["name"],
    region: json["region"],
    image: json["image"],
    priority: json["priority"],
    displayPriority: DisplayPriority.fromJson(json["displayPriority"]),
  );

  void toggleSelection(){
    isSelected = !isSelected;
  }
}

class DisplayPriority {
  int position;
  Status status;

  DisplayPriority({
    required this.position,
    required this.status,
  });

  factory DisplayPriority.fromJson(Map<String, dynamic> json) => DisplayPriority(
    position: json["position"],
    status: statusValues.map[json["status"]]!,
  );
}

enum Status {
  HIDDEN,
  NOT_SELECTED,
  SELECTED,
  FORCE_SELECTED
}

final statusValues = EnumValues({
  "hidden": Status.HIDDEN,
  "not_selected": Status.NOT_SELECTED,
  "selected": Status.SELECTED,
  "force_selected": Status.FORCE_SELECTED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
