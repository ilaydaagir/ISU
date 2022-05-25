import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeTabbar extends StatefulWidget {
  const HomeTabbar({required this.screens});

  static const Tag = "Tabbar";
  final List<Widget> screens;
  @override
  State<StatefulWidget> createState() {
    return _HomeTabbarState();
  }
}

class _HomeTabbarState extends State<HomeTabbar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: widget.screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromRGBO(94, 97, 244, 1),
        backgroundColor: Color.fromRGBO(203, 81, 94, 1),
        animationDuration: Duration(milliseconds: 200),
        onTap: onTabTapped,
        items: [
          Icon(
            Icons.account_balance_rounded,
            size: 35,
            color: Colors.blue.shade200,
          ),
          Icon(
            Icons.help_outline_rounded,
            size: 35,
            color: Colors.blue.shade200,
          ),
          Icon(
            Icons.info,
            size: 35,
            color: Colors.blue.shade200,
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
