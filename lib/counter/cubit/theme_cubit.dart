// ignore_for_file: lines_longer_than_80_chars

import 'dart:developer';

import 'package:animated_counter/themes/app_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.system)) {
    updateTheme();
  }

  void updateTheme() {
    final currentTheme = AppTheme.currentSystemTheme;
    currentTheme == Brightness.light ? _setTheme(ThemeMode.light) : _setTheme(ThemeMode.dark);
  }

  void changeTheme() {
    final currentTheme = AppTheme.currentSystemTheme;
    log(currentTheme.toString());
    currentTheme == Brightness.light ? _setTheme(ThemeMode.dark) : _setTheme(ThemeMode.light);
  }

  void _setTheme(ThemeMode themeMode) {
    log('set theme called');
    AppTheme.setStatusBarAndNavBarColor(themeMode);
    emit(ThemeState(themeMode: themeMode));
  }
}
