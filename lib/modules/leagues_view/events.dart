import 'package:lol_esports/modules/leagues_fetch/lib.dart' as leagues_f;
import '../../models/basic_event.dart';

class GetSelected extends BasicEvent {}

class Select extends BasicEvent {
  @override
  List<Object?> get props => [league.id];

  final leagues_f.League league;

  Select(this.league);
}