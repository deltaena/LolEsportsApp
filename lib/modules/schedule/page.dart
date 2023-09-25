import 'package:flutter/material.dart';

import 'package:lol_esports/views/custom/delta_app_bar.dart';
import 'package:lol_esports/views/custom/delta_drawer.dart';

import 'bloc_builders/list_bloc_builder.dart';

class Page extends StatelessWidget {

  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DeltaAppBar(),
        drawer: DeltaDrawer(),
        body: const ListBlocBuilder());
  }
}