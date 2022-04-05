import 'package:animated_counter/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: const Center(
          child: Text(
            'Switch',
          ),
        ),
      ),
    );
  }
}
