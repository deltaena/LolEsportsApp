import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lol_esports/services/lolesports_service.dart';

import 'package:lol_esports/modules/schedule/lib.dart' as schedule;
import 'package:lol_esports/modules/leagues_fetch/lib.dart' as lf;
import 'package:lol_esports/modules/leagues_view/lib.dart' as lv;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final ThemeData appThemeData = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(30, 30, 30, 1),
          brightness: Brightness.dark
      ),
      appBarTheme: const AppBarTheme(
        elevation: 1,
        shadowColor: Colors.white,
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(fontSize: 20),
        bodyMedium: TextStyle(fontSize: 18),
        bodySmall: TextStyle(fontSize: 16),
        labelLarge: TextStyle(color: Color.fromRGBO(30, 30, 30, 1), fontSize: 20, fontWeight: FontWeight.bold),
        labelMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        labelSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      )
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lol Esports',
        theme: appThemeData,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => lf.LFBloc(LolesportsService.getInstance())),
            BlocProvider(create: (_) => lv.LVBloc()),
            BlocProvider(create: (_) => schedule.SBloc(LolesportsService.getInstance())),
          ],
          child: const schedule.Page()
        )
    );
  }
}

