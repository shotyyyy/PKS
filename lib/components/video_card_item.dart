import 'package:flutter/material.dart';
import 'package:hello_app/pages/VideoCardDetailScreen.dart';
import 'package:hello_app/models/VideoCard.dart';

class ItemCard extends StatelessWidget {
  final VideoCard videoCard;

  ItemCard({required this.videoCard});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CardPage(videoCard: videoCard),
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CardPage(videoCard: videoCard),
                  ),
                );
              },
              child: Text('Подробнее'),
            ),
          ],
        ),
      ),
    );
  }
}