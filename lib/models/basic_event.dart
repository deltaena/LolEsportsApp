import 'package:equatable/equatable.dart';

abstract class BasicEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Requested extends BasicEvent {
  final Map<String, dynamic> args;

  Requested(this.args);
}