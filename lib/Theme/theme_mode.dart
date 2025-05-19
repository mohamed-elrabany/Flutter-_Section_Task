import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeProvider with ChangeNotifier {
  bool _lightMode = true;
  bool get lightMode => _lightMode;

  ThemeProvider();

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _lightMode = prefs.getBool('theme') ?? true;
    notifyListeners();
  }

  void toggleTheme() async {
    _lightMode = !_lightMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('theme', _lightMode);
    notifyListeners();
  }

  ThemeData get currentTheme => _lightMode ? ThemeData.light() : ThemeData.dark();
}

