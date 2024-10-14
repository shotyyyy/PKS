import 'package:flutter/material.dart';
import '../models/video_card.dart';

class DetailsScreen extends StatelessWidget {
  final VideoCard videoCard;

  DetailsScreen({required this.videoCard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(videoCard.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(videoCard.imageUrl, height: 200, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              videoCard.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Price: \$${videoCard.price}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
