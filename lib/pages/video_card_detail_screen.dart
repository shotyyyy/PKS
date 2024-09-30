import 'package:flutter/material.dart';
import 'package:hello_app/models/VideoCard.dart';

class CardPage extends StatelessWidget {
  final VideoCard videoCard;

  CardPage({required this.videoCard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(videoCard.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(videoCard.imageUrl),
            SizedBox(height: 16.0),
            Text(
              videoCard.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${videoCard.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              videoCard.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
