

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taskone/favorite/favorite_screen.dart';
import 'package:flutter_taskone/profile/profile_page/profile_page.dart';
import 'package:flutter_taskone/qoute/quote_screen.dart';
import 'package:flutter_taskone/quiz/quiz_page.dart';

import 'dashboard_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
      index: _selectedIndex,
      children: [
        DashboardScreen(),
        QouteScreen(),
        FavoriteScreen(),
        ProfilePage()
      ],
    ),
      bottomNavigationBar: NavigationBar(
      onDestinationSelected: (index){
            setState(() {
              _selectedIndex=index;
            });
      },
      destinations: [
        NavigationDestination(icon: Icon(Icons.dashboard), label: "Dashboard"),
        NavigationDestination(icon: Icon(Icons.format_quote), label: "Quote"),
        NavigationDestination(icon: Icon(Icons.favorite), label: "Favorite"),
        NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
      ]),
    );
  }
}
