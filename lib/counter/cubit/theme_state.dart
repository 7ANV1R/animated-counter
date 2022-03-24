// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {
  ThemeInitial({required this.themeMode});

  final ThemeMode themeMode;
}

class ThemeDark extends ThemeState {
  ThemeDark({required this.themeMode});

  final ThemeMode themeMode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ThemeDark && other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;
}

class ThemeLight extends ThemeState {
  ThemeLight({required this.themeMode});

  final ThemeMode themeMode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ThemeLight && other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;
}

// class ThemeState {
//   ThemeState({required this.themeMode});
//   final ThemeMode themeMode;
// }
