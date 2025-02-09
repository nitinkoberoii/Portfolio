import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = AppTheme.lightTheme;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == AppTheme.darkTheme;

  void toggleTheme() {
    _themeData = isDarkMode ? AppTheme.lightTheme : AppTheme.darkTheme;
    notifyListeners();
  }
}
