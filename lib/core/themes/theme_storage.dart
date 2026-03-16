import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeStorage {
  static const String _themeKey = 'theme';
  final String boxName = 'settings';
  final Box box = Hive.box('settings');

  ThemeMode loadTheme() {
    final theme = box.get(
      _themeKey,
      //  defaultValue: 'light',
    );
    switch (theme) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  Future<void>  saveTheme(ThemeMode mode) async {
    await box.put(_themeKey, mode.name);
  }
}

// Theme.of(context).brightness == Brightness.light