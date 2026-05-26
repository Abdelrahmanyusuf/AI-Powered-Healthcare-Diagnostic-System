import 'package:flutter/material.dart';
import 'package:tamenny_app/config/cache_helper.dart';

import 'package:tamenny_app/core/theme/app_colors.dart';

class ThemeNotifier extends ChangeNotifier {
  static const String _themeKey = 'isDarkMode';
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeData get currentTheme => _isDark ? darkTheme : lightTheme;

  ThemeNotifier() {
    loadThemeFromPrefs(); // Load saved theme on init
  }

  void toggleTheme() async {
    _isDark = !_isDark;
    notifyListeners();
    _saveThemeToPrefs();
  }

  void setDarkMode(bool value) {
    _isDark = value;
    notifyListeners();
    _saveThemeToPrefs();
  }

  Future<void> loadThemeFromPrefs() async {
    _isDark = CacheHelper.getBool(key: _themeKey) ?? false;
    notifyListeners();
  }

  Future<void> _saveThemeToPrefs() async {
    await CacheHelper.set(key: _themeKey, value: _isDark);
  }
}

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.darkPrimaryColor,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  primaryColor: AppColors.darkPrimaryColor,
  cardColor: AppColors.darkCardColor,
  dividerColor: AppColors.darkDividerColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkBackgroundColor,
    foregroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.darkTextColor),
    bodyMedium: TextStyle(color: AppColors.darkSecondaryTextColor),
    titleLarge: TextStyle(color: AppColors.darkTextColor),
  ),
  iconTheme: const IconThemeData(color: AppColors.darkTextColor),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkCardColor,
    selectedItemColor: AppColors.darkPrimaryColor,
    unselectedItemColor: AppColors.darkSecondaryTextColor,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.darkPrimaryColor),
    trackColor:
        WidgetStateProperty.all(AppColors.darkPrimaryColor.withOpacity(0.4)),
  ),
);

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: AppColors.grayColor,
  primaryColor: AppColors.primaryColor,
  cardColor: Colors.white,
  dividerColor: AppColors.deepGrayColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.grayColor,
    foregroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black87),
    titleLarge: TextStyle(color: Colors.black),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: Colors.grey,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.primaryColor),
    trackColor:
        WidgetStateProperty.all(AppColors.primaryColor.withOpacity(0.4)),
  ),
);
