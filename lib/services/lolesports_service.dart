import 'package:lol_esports/models/constants.dart';
import 'package:http/http.dart' as http;


abstract class LolesportsService {
  static final LolesportsService _lolesportsService = LolesportsServiceImpl();

  Future<http.Response> getLeaguesJson();
  Future<http.Response> getLiveGamesJson();
  Future<http.Response> getScheduleJson(List<int> leaguesIds);
  Future<http.Response> getEventDetailsJson(int matchId);
  List<Future<http.Response>> getGameDetailsJson(List<int> gameIds, DateTime endingTime);

  static LolesportsService getInstance(){ return _lolesportsService;}
}

class LolesportsServiceImpl extends LolesportsService{

  @override
  Future<http.Response> getLeaguesJson() {
    String url = '${Constants.baseStaticUrl}/persisted/gw/getLeagues?hl=${Constants.hl}';
    return launchPetition(url);
  }

  @override
  Future<http.Response> getLiveGamesJson() {
    String url = '${Constants.baseLiveUrl}/persisted/gw/getLive?hl=${Constants.hl}';
    return launchPetition(url);
  }

  @override
  Future<http.Response> getScheduleJson(List<int> leaguesIds) {
    String leaguesIdsParam = "";

    if(leaguesIds.isNotEmpty) { leaguesIdsParam = "&leagueId=${leaguesIds.join(",")}"; }

    String url = "${Constants.baseStaticUrl}/persisted/gw/getSchedule?hl=${Constants.hl}$leaguesIdsParam";
    return launchPetition(url);
  }

  @override
  Future<http.Response> getEventDetailsJson(int eventId){
    String url = "${Constants.baseStaticUrl}/persisted/gw/getEventDetails?hl=${Constants.hl}&id=$eventId";

    return launchPetition(url);
  }

  @override
  List<Future<http.Response>> getGameDetailsJson(List<int> gameIds, DateTime endingTime){
    List<Future<http.Response>> responses = List.empty(growable: true);

    for(var gameId in gameIds){
      String url = "${Constants.baseLiveUrl}/livestats/v1/window/$gameId?startingTime=${endingTime.toIso8601String()}z";
      responses.add(launchPetition(url));
    }

    return responses;
  }

  Future<http.Response> launchPetition(String url) {
    print("launching petition: $url");
    return http.get(Uri.parse(url), headers: {"x-api-key": Constants.apiKey});
  }
}















