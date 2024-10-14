import 'package:flutter/material.dart';
import '../models/video_card.dart';

class VideoCardItem extends StatelessWidget {
  final VideoCard videoCard;
  final bool isFavorite;
  final Function onFavoriteToggle;
  final Function onDelete;
  final Function onViewDetails;

  VideoCardItem({
    required this.videoCard,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onDelete,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Image.network(
            videoCard.imageUrl,
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              videoCard.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () => onFavoriteToggle(),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.grey),
                onPressed: () => onDelete(),
              ),
              IconButton(
                icon: Icon(Icons.info_outline, color: Colors.grey),
                onPressed: () => onViewDetails(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
