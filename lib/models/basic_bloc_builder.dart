import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/loader.dart';
import 'basic_event.dart';
import 'basic_state.dart';

abstract class BaseBlocBuilder extends StatelessWidget {

  const BaseBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Bloc<BasicEvent, BasicState>, BasicState>(
        bloc: getBloc(context),
        builder: (context, state) {
          switch(state.current){
            case BasicStatesEnum.notStarted: return onNotStarted(context);
            case BasicStatesEnum.started: return onStarted();
            case BasicStatesEnum.ko: return onKo(state.koArgs);
            case BasicStatesEnum.ok: return onOk(state.okArgs);

            case BasicStatesEnum.updated: return onUpdated(state.okArgs);
            case BasicStatesEnum.selected: return onSelected(state.okArgs);
            case BasicStatesEnum.gettingSelection: return onGettingSelection(state.okArgs);
          }
        });
  }

  Bloc<BasicEvent, BasicState> getBloc(BuildContext context);

  Widget onNotStarted(BuildContext context) { return const Text("notStarted"); }
  Widget onStarted() { return const Loader(); }

  Widget onKo(KoArgs koArgs) { return Text("ko"); }
  Widget onOk(OkArgs okArgs) { return Text("ok"); }

  Widget onUpdated(OkArgs okArgs) { return Text("updated"); }
  Widget onSelected(OkArgs okArgs) { return Text("selected"); }
  Widget onGettingSelection(OkArgs okArgs) { return Text("gettingSelection"); }

}