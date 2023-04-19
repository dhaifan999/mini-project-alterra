import 'package:flutter/material.dart';
import 'package:mini_project/screen/about_screen.dart';
import 'package:mini_project/screen/disease_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(title: ''),
    const DiseasePage(),
    const AboutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tomatocare'),
        centerTitle: true,
        leading: SizedBox(
          height: double.infinity,
          width: kToolbarHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Image.asset(
                  'assets/img/icon.png',
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Disease',
            icon: Icon(Icons.wb_sunny),
          ),
          BottomNavigationBarItem(
            label: 'About',
            icon: Icon(Icons.account_circle),
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutPage()),
            );
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }
}
