import 'dart:convert';

import '../modules/schedule/model.dart';

class FlutterWidgetData {
  final Team blueTeam;
  final Team redTeam;

  FlutterWidgetData({
    required this.blueTeam,
    required this.redTeam
  });

  factory FlutterWidgetData.fromJson(Map<String, dynamic> json) => FlutterWidgetData(
    blueTeam: json['blueTeam'],
    redTeam: json['redTeam']
  );

  Map<String, dynamic> toJson() =>
      {
        'blueTeam': blueTeam.toJson(),
        'redTeam': redTeam.toJson()
      };
}