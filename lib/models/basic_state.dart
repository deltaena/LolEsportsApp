import 'package:equatable/equatable.dart';

enum BasicStatesEnum { notStarted, started, ko, ok, updated, selected, gettingSelection }

abstract class BasicState extends Equatable {

  @override
  List<Object?> get props => [current, okArgs];

  final BasicStatesEnum current;

  final KoArgs koArgs;
  final OkArgs okArgs;

  const BasicState({
    this.current = BasicStatesEnum.notStarted,
    this.koArgs = const KoArgs.empty(),
    this.okArgs = const OkArgs.empty()
  });

  const BasicState.started({
    this.current = BasicStatesEnum.started,
    this.koArgs = const KoArgs.empty(),
    this.okArgs = const OkArgs.empty()
  });

  const BasicState.ko({
    this.current = BasicStatesEnum.ko,
    this.koArgs = const KoArgs.empty(),
    this.okArgs = const OkArgs.empty()
  });

  const BasicState.ok({
    this.current = BasicStatesEnum.ok,
    this.koArgs = const KoArgs.empty(),
    this.okArgs = const OkArgs.empty()
  });

  const BasicState.selected({
    this.current = BasicStatesEnum.selected,
    this.koArgs = const KoArgs.empty(),
    this.okArgs = const OkArgs.empty()
  });

  const BasicState.gettingSelection({
    this.current = BasicStatesEnum.gettingSelection,
    this.koArgs = const KoArgs.empty(),
    this.okArgs = const OkArgs.empty()
  });
}

class KoArgs {
  final int errorCode;
  final String errorMessage;

  KoArgs(this.errorCode, this.errorMessage);

  const KoArgs.empty({this.errorCode = 0, this.errorMessage = ""});
}

class OkArgs {
  final Map<String, dynamic> results;

  OkArgs(this.results);

  const OkArgs.empty({this.results = const {}});

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is OkArgs &&
          runtimeType == other.runtimeType &&
          results == other.results;

  @override
  int get hashCode => results.hashCode;
}
























