import 'package:flutter/material.dart';
import '../models/video_card.dart';
import '../components/video_card_item.dart';
import 'video_card_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<VideoCard> favoriteCards;
  final Function(VideoCard) toggleFavorite;

  FavoritesScreen({
    required this.favoriteCards,
    required this.toggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Избранное')),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: favoriteCards.length,
        itemBuilder: (context, index) {
          final videoCard = favoriteCards[index];
          return VideoCardItem(
            videoCard: videoCard,
            isFavorite: true,
            onFavoriteToggle: () => toggleFavorite(videoCard),
            onDelete: () {},
            onViewDetails: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(videoCard: videoCard),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
