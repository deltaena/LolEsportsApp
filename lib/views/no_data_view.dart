import 'package:flutter/material.dart';

class NoDataView extends StatelessWidget {

  const NoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No data to show... :(", style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }

}