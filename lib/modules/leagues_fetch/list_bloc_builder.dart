import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_esports/models/basic_bloc_builder.dart';
import 'package:lol_esports/models/basic_state.dart';

import '../../models/basic_event.dart';
import '../../views/loader.dart';
import '../../views/no_data_view.dart';

import 'model.dart';
import 'bloc.dart';

import 'package:lol_esports/modules/leagues_view/lib.dart' as leagues_v;

class ListBlocBuilder extends BaseBlocBuilder {

  const ListBlocBuilder({super.key});

  @override
  Bloc<BasicEvent, BasicState> getBloc(BuildContext context) {
    return context.read<LFBloc>();
  }

  @override
  Widget onNotStarted(BuildContext context) {
    getBloc(context).add(Requested(const {  }));
    return Loader();
  }

  @override
  Widget onOk(OkArgs okArgs) {
    List<League> leagues = okArgs.results["leagues"];

    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(height: 1, color: Colors.white),
      padding: EdgeInsets.zero,
      itemCount: leagues.length,
      itemBuilder: (BuildContext context, int index) {
        return leagues_v.ListElement(leagues[index]);
      },
    );
  }

}

/*
class ListBlocBuilder extends StatelessWidget {

  const ListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LBloc, BasicState>(
        builder: (context, state) {
          if(state is NotStarted) {
            context.read<LBloc>().add(Requested(const {  }));
            return const NoDataView();
          }

          if(state is Started) return Loader();

          if(state is Ko) return const Text("failed :(");

          return getListView((state as Ok).leagues);
        }
    );
  }

  ListView getListView(List<League> leagues){
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(height: 1, color: Colors.white),
      padding: EdgeInsets.zero,
      itemCount: leagues.length,
      itemBuilder: (BuildContext context, int index) {
        return leagues_v.ListElement(leagues[index]);
        },
    );
  }
}
*/








