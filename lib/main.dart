import 'package:flutter/material.dart';
import 'package:flutter_taskone/Theme/theme_mode.dart';
import 'package:flutter_taskone/add_item/item_model.dart';
import 'package:flutter_taskone/dashboard/dashboard_screen.dart';
import 'package:flutter_taskone/add_item/add_item_screen.dart';
import 'package:flutter_taskone/dashboard/nav_bar.dart';
import 'package:flutter_taskone/favorite/favorite_model.dart';
import 'package:flutter_taskone/profile/user_model.dart';
import 'package:flutter_taskone/regestration/login.dart';
import 'package:flutter_taskone/screen/splash_animated.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeProvider = ThemeProvider();
  await themeProvider.init();  // Wait for theme loading before app runs

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => ItemModel()),
        ChangeNotifierProvider(create: (context) => FavoriteModel()),
        ChangeNotifierProvider(create: (context) => themeProvider),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      themeAnimationStyle: AnimationStyle(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 300),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeProvider.currentTheme,
      home: splash_animated(),
    );
  }
}
