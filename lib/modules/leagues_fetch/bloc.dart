import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:lol_esports/models/basic_bloc_state.dart';

import 'package:lol_esports/services/lolesports_service.dart';

import '../../models/basic_event.dart';
import '../../models/basic_state.dart';
import 'model.dart';

class LFBloc extends Bloc<BasicEvent, BasicState> {
  final LolesportsService _lolesportsService;

  LFBloc(this._lolesportsService) : super(const BasicBlocState()) {
    on<Requested>((event, emit) async {
      emit(const BasicBlocState.started());

      Response response = await _lolesportsService.getLeaguesJson();

      if(response.statusCode == 200){
        OkArgs okArgs = OkArgs({ "leagues": getLeaguesFromJson(response.body) });
        emit(BasicBlocState.ok(okArgs: okArgs));
      } else {
        KoArgs koArgs = KoArgs(response.statusCode, response.body);
        emit(BasicBlocState.ko(koArgs: koArgs));
      }
    });
  }

}