import 'package:edumate/core/themes/theme_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);

class ThemeNotifier extends Notifier<ThemeMode> {
  final themestorage = ThemeStorage();
  
  @override
  ThemeMode build() {
    return themestorage.loadTheme();
  }

  void toggleTheme(ThemeMode mode) {
    state = mode;
    themestorage.saveTheme(mode);
  }
  
}
