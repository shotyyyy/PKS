import 'package:flutter/material.dart';
import 'pages/video_card_list_screen.dart';
import 'pages/favorites_screen.dart';
import 'pages/profile_screen.dart';
import 'models/video_card.dart';
import 'pages/cart_screen.dart';

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


  Map<VideoCard, int> cartItems = {};
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

  void addToCart(VideoCard card) {
    setState(() {
      if (cartItems.containsKey(card)) {
        cartItems[card] = cartItems[card]! + 1;
      } else {
        cartItems[card] = 1;
      }
    });
  }

  void removeFromCart(VideoCard card) {
    setState(() {
      if (cartItems.containsKey(card)) {
        if (cartItems[card]! > 1) {
          cartItems[card] = cartItems[card]! - 1;
        } else {
          cartItems.remove(card);
        }
      }
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
            addToCart: addToCart,
          ),
          FavoritesScreen(
              favoriteCards: favoriteCards,
              toggleFavorite: toggleFavorite,
              addToCart: addToCart,
          ),
          CartScreen(
              cartItems: cartItems,
              addToCart: addToCart,
              removeFromCart: removeFromCart
          ),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
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
            icon: Icon(Icons.shopping_cart),
            label: 'Корзина (${cartItems.values.fold(0, (sum, count) => sum + count)})',
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