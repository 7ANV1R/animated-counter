import 'package:animated_counter/counter/cubit/theme_cubit.dart';
import 'package:animated_counter/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = AppTheme.currentSystemTheme;
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
            child: TextButton(
                onPressed: () {
                  context.read<ThemeCubit>().switchTheme();
                },
                child: Text('Switch'))),
      ),
    );
  }
}
