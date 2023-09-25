import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../models/basic_bloc_state.dart';
import '../../models/basic_event.dart';
import '../../models/basic_state.dart';
import '../../services/lolesports_service.dart';

import 'model.dart';

class GDBloc extends Bloc<BasicEvent, BasicState> {
  final LolesportsService _lolesportsService;

  GDBloc(this._lolesportsService): super(const BasicBlocState()){
    on<Requested>((event, emit) async {
      emit(const BasicBlocState.started());

      List<GameDetails> gamesDetails = List.empty(growable: true);

      List<Future<Response>> responses = _lolesportsService.getGameDetailsJson(event.args["matchIds"], event.args["endingTime"]);

      for(Future<Response> futureResponse in responses){
        Response response = await futureResponse;

        if(response.statusCode == 200) {
          gamesDetails.add(getGameDetailsFromJson(response.body));
        } else {
          emit(BasicBlocState.ko(koArgs: KoArgs(response.statusCode, response.body)));
        }
      }

      emit(BasicBlocState.ok(okArgs: OkArgs({ "gamesDetails": gamesDetails})));
    });
  }
}



















