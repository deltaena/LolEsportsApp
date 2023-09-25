import 'package:flutter/material.dart';
import 'package:lol_esports/modules/game_details/model.dart';
import 'package:lol_esports/views/shapes/base_dragon_painter.dart';

import 'package:lol_esports/views/shapes/objectives/objective_painters_lib.dart';
import 'package:tuple/tuple.dart';
import '../views/shapes/dragons/dragon_painters_lib.dart';

class Constants {
  static const apiKey = "0TvQnueqKa5mxJntVWt0w4LpLfEkrV1Ta8rQBb9Z";

  static const baseStaticUrl = "https://esports-api.lolesports.com";
  static const baseLiveUrl = "https://feed.lolesports.com";

  static const hl = "es-ES";

  static CustomPainter getDragonPainter(Dragon dragon){
    switch (dragon) {
      case Dragon.chemtech:
        return ChemtechDragonPainter();
      case Dragon.mountain:
        return MountainDragonPainter();
      case Dragon.infernal:
        return InfernalDragonPainter();
      case Dragon.hextech:
        return HextechDragonPainter();
      case Dragon.ocean:
        return OceanDragonPainter();
      case Dragon.cloud:
        return CloudDragonPainter();
      case Dragon.elder:
        return ElderDragonPainter();
    }
  }

  static Tuple2<BaseShapePainter, String> getObjectivePainterAndCount(String objective, Team team, bool isBlue){

    Color color = isBlue ? Colors.blueAccent : Colors.redAccent;

    switch(objective) {
      case "inhibitor":
        return Tuple2(InhibitorPainter(color), "${team.inhibitors}");
      case "baron":
        return Tuple2(BaronPainter(color), "${team.barons}");
      case "towers":
        return Tuple2(TowerPainter(color), "${team.towers}");
    }

    return Tuple2(KillsPainter(color), "${team.totalKills}");
  }

  static getChampionIcon(String championId){
    return "https://ddragon.leagueoflegends.com/cdn/13.15.1/img/champion/$championId.png";
  }
}