import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_esports/models/basic_bloc_state.dart';

import '../../models/basic_event.dart';
import '../../models/basic_state.dart';
import 'events.dart';
import 'states.dart';

class LVBloc extends Bloc<BasicEvent, BasicState> {
  final List<int> selectedLeaguesIds = List.empty(growable: true);

  LVBloc() : super(const BasicBlocState()) {
    on<GetSelected>((event, emit) async {
      OkArgs okArgs = OkArgs({ "selectedLeaguesIds": selectedLeaguesIds });
      emit(LeagueViewStates.gettingSelection(okArgs: okArgs));
    });

    on<Select>((event, emit) async {
      event.league.isSelected ? selectedLeaguesIds.add(event.league.id) : selectedLeaguesIds.remove(event.league.id);

      print(selectedLeaguesIds);

      OkArgs okArgs = OkArgs({ "league": event.league });
      emit(LeagueViewStates.selected(okArgs: okArgs));
    });
  }

}