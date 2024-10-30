import 'package:flutter/material.dart';
import 'pages/catalog_screen.dart';
import 'pages/cart_screen.dart';
import 'pages/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    CatalogScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar:
      BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 24, height: 24),
            activeIcon: Image.asset('assets/icons/home-active.png', width: 24, height: 24),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/cart.png', width: 24, height: 24),
            activeIcon: Image.asset('assets/icons/cart-active.png', width: 24, height: 24),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/profile.png', width: 24, height: 24),
            activeIcon: Image.asset('assets/icons/profile-active.png', width: 24, height: 24),
            label: 'Профиль',
          ),
        ],
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
