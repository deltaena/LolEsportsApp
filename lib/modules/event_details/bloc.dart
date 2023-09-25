import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'package:lol_esports/models/basic_event.dart';
import 'package:lol_esports/models/basic_state.dart';

import '../../models/basic_bloc_state.dart';

import 'model.dart';

import '../../services/lolesports_service.dart';

class EDBloc extends Bloc<BasicEvent, BasicState> {
  final LolesportsService _lolesportsService;

  EDBloc(this._lolesportsService): super(const BasicBlocState()){
    on<Requested>((event, emit) async {
      emit(const BasicBlocState.started());

      Response response = await _lolesportsService.getEventDetailsJson(event.args["event"].match.id);

      if(response.statusCode == 200){
        OkArgs okArgs = OkArgs({ "event_details": getEventDetailsFromJson(response.body) });
        emit(BasicBlocState.ok(okArgs: okArgs));
      } else {
        KoArgs koArgs = KoArgs(response.statusCode, response.body);
        emit(BasicBlocState.ko(koArgs: koArgs));
      }
    });
  }
}