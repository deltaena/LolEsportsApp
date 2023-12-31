import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lol_esports/modules/leagues_view/bloc.dart';

import '../../../models/basic_event.dart';

import '../lib.dart' as schedule;

class ButtonBlocBuilder extends StatelessWidget {

  Text buttonText (BuildContext context) => Text(
    "SAVE",
    style: Theme.of(context).textTheme.labelLarge,
    textAlign: TextAlign.center,
  );

  const ButtonBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // register tap actions on button
        onTap: () => {
          context.read<schedule.SBloc>().add(Requested({ "leaguesIds": context.read<LVBloc>().selectedLeaguesIds })),
          Navigator.pop(context)
        },
        child: SizedBox( // give width
          width: 100.w,
          child: Card( // round content
            color: Colors.white,
            child: buttonText(context),
          ),
        )
    );
  }
}