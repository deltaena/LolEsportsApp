import 'package:lol_esports/models/basic_state.dart';

class BasicBlocState extends BasicState {

  const BasicBlocState({super.current});

  const BasicBlocState.started() : super.started();
  const BasicBlocState.ko({super.koArgs}) : super.ko();
  const BasicBlocState.ok({super.okArgs}) : super.ok();
}