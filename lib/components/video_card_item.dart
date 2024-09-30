import 'package:flutter/material.dart';
import '../models/video_card.dart';
import '../pages/video_card_detail_screen.dart';

class VideoCardItem extends StatelessWidget {
  final VideoCard videoCard;

  VideoCardItem({required this.videoCard});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoCardDetailScreen(videoCard: videoCard),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(videoCard.imageUrl),
            ListTile(
              title: Text(videoCard.name),
              subtitle: Text('\$${videoCard.price.toStringAsFixed(2)}'),
            ),
          ],
        ),
      ),
    );
  }
}