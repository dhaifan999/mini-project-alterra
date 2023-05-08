import 'package:flutter/material.dart';

class BottomNavbarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;
  const BottomNavbarWidget({
    Key? key,
    this.currentIndex = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wb_sunny),
          label: 'Disease',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'About',
        ),
      ],
      backgroundColor: const Color(0xFF2465ac),
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.lightBlue,
      showUnselectedLabels: true,
      onTap: onTap,
    );
  }
}
