import 'package:equatable/equatable.dart';

import 'model.dart';

abstract class States extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotStarted extends States {}
class Started extends States {}

class Ok extends States {
  late final List<League> leagues;

  Ok(this.leagues);
}
class Ko extends States {
  late final int code;
  late final String message;

  Ko(this.code, this.message);
}














