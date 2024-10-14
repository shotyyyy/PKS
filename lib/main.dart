import 'package:flutter/material.dart';
import 'pages/video_card_list_screen.dart';
import 'pages/favorites_screen.dart';
import 'pages/profile_screen.dart';
import 'models/video_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Cards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  List<VideoCard> favoriteCards = [];

  void toggleFavorite(VideoCard card) {
    setState(() {
      if (favoriteCards.contains(card)) {
        favoriteCards.remove(card);
      } else {
        favoriteCards.add(card);
      }
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          VideoCardListScreen(
            favoriteCards: favoriteCards,
            toggleFavorite: toggleFavorite,
          ),
          FavoritesScreen(favoriteCards: favoriteCards, toggleFavorite: toggleFavorite),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Список товаров',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
