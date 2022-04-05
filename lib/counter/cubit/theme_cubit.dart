// ignore_for_file: lines_longer_than_80_chars

import 'dart:developer';

import 'package:animated_counter/themes/app_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(themeMode: ThemeMode.system)) {
    updateTheme();
  }

  void updateTheme() {
    final currentTheme = AppTheme.currentSystemTheme;
    currentTheme == Brightness.light ? setTheme(ThemeMode.light) : setTheme(ThemeMode.dark);
  }

  // void switchTheme() {
  //   final currentTheme = AppTheme.currentSystemTheme;
  //   currentTheme == Brightness.light ? setTheme(ThemeMode.dark) : setTheme(ThemeMode.light);
  // }

  void setTheme(ThemeMode themeMode) {
    log('set theme called');
    AppTheme.setStatusBarAndNavBarColor(themeMode);
    if (themeMode == ThemeMode.dark) {
      log('Emiting themedark');
      emit(ThemeDark(themeMode: themeMode));
    } else {
      log('Emiting theme light');
      emit(ThemeLight(themeMode: themeMode));
    }
  }
}
