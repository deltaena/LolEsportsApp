import 'package:lol_esports/models/basic_state.dart';
import 'package:lol_esports/modules/leagues_fetch/lib.dart' as leagues_f;

import '../../models/basic_bloc_state.dart';

class LeagueViewStates extends BasicState {

  const LeagueViewStates.selected({ super.okArgs }): super.selected();

  const LeagueViewStates.gettingSelection({ super.okArgs }): super.gettingSelection();
}

/*
class Selected extends BasicBlocState {
  final leagues_f.League league;

  const Selected(this.league);
}

class GottenSelection extends BasicBlocState {
  final List<int> selectedLeaguesIds;

  const GottenSelection(this.selectedLeaguesIds);
}

 */

