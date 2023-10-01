import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lol_esports/services/lolesports_service.dart';

import 'package:lol_esports/modules/schedule/lib.dart' as schedule;
import 'package:lol_esports/modules/leagues_fetch/lib.dart' as lf;
import 'package:lol_esports/modules/leagues_view/lib.dart' as lv;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  ThemeData appThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(30, 30, 30, 1),
          brightness: Brightness.dark
      ),
      appBarTheme: const AppBarTheme(
        elevation: 1,
        shadowColor: Colors.white,
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(fontSize: 20.sp),
        bodyMedium: TextStyle(fontSize: 18.sp),
        bodySmall: TextStyle(fontSize: 16.sp),
        labelLarge: TextStyle(color: const Color.fromRGBO(30, 30, 30, 1), fontSize: 20.sp, fontWeight: FontWeight.bold),
        labelMedium: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        labelSmall: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      )
  );
  }

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("width: ${MediaQuery.of(context).size.width} height: ${MediaQuery.of(context).size.height}");

    return ScreenUtilInit(
        designSize: const Size(400, 900),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_ , child) {
          return MaterialApp(
              title: 'Lol Esports',
              theme: ThemeData(
                  useMaterial3: true,
                  colorScheme: ColorScheme.fromSeed(
                      seedColor: const Color.fromRGBO(30, 30, 30, 1),
                      brightness: Brightness.dark
                  ),
                  appBarTheme: const AppBarTheme(
                    elevation: 1,
                    shadowColor: Colors.white,
                  ),
                  textTheme: TextTheme(
                    titleMedium: TextStyle(fontSize: 20.h),
                    bodyMedium: TextStyle(fontSize: 20.h),
                    bodySmall: TextStyle(fontSize: 18.h),
                    labelLarge: TextStyle(color: const Color.fromRGBO(30, 30, 30, 1),
                        fontSize: 20.h,
                        fontWeight: FontWeight.bold),
                    labelMedium: TextStyle(
                        fontSize: 18.h, fontWeight: FontWeight.bold),
                    labelSmall: TextStyle(
                        fontSize: 16.h, fontWeight: FontWeight.bold),
                    headlineSmall: TextStyle(
                      fontSize: 15.h, fontWeight: FontWeight.bold)
                  )
              ),
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
    );
  }
}

