import 'package:flutter/material.dart';
import '../models/video_card.dart';
import '../api/api_service.dart';

class FavoritesScreen extends StatefulWidget {
  final List<VideoCard> favoriteCards;

  FavoritesScreen({required this.favoriteCards});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final ApiService _apiService = ApiService();

  void toggleFavorite(VideoCard card) async {
    try {
      if (widget.favoriteCards.contains(card)) {
        await _apiService.removeFromFavorites(card.id!);
        setState(() {
          widget.favoriteCards.remove(card);
        });
      } else {
        await _apiService.addToFavorites(card);
        setState(() {
          widget.favoriteCards.add(card);
        });
      }
    } catch (e) {
      print('Ошибка изменения избранного: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Избранное')),
      body: ListView.builder(
        itemCount: widget.favoriteCards.length,
        itemBuilder: (context, index) {
          final card = widget.favoriteCards[index];
          return ListTile(
            title: Text(card.name),
            subtitle: Text(card.description),
            trailing: IconButton(
              icon: Icon(Icons.favorite, color: Colors.red),
              onPressed: () => toggleFavorite(card),
            ),
          );
        },
      ),
    );
  }
}
