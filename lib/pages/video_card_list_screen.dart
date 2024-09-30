import 'package:flutter/material.dart';
import '../models/video_card.dart';
import '../widgets/video_card_item.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'Видеокарты',
//     home: VideoCardListScreen(),
//   ));
// }

class VideoCardListScreen extends StatelessWidget {
  // Пример списка товаров (видеокарт)
  final List<VideoCard> videoCards = [
    VideoCard(
      name: 'NVIDIA GeForce RTX 3080',
      description:
      'Видеокарта с производительностью нового поколения для игр и работы.',
      imageUrl:
      'https://cdn.mos.cms.futurecdn.net/RskUoeZxphtUPaiTNPdZ5b-1200-80.jpg',
      price: 899.99,
    ),
    VideoCard(
      name: 'AMD Radeon RX 6800 XT',
      description:
      'Высокопроизводительная видеокарта от AMD для современных игр.',
      imageUrl:
      'https://cdn.mos.cms.futurecdn.net/9dnrkwFT7hRT4XvHhZJDFH-1200-80.jpg',
      price: 649.99,
    ),
    VideoCard(
      name: 'NVIDIA GeForce GTX 1660 Super',
      description: 'Отличный выбор для геймеров с бюджетом.',
      imageUrl:
      'https://cdn.mos.cms.futurecdn.net/fUQGDj9TPXBFkZ5TYgE75P-1200-80.jpg',
      price: 229.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список видеокарт'),
      ),
      body: ListView.builder(
        itemCount: videoCards.length,
        itemBuilder: (context, index) {
          return VideoCardItem(
            videoCard: videoCards[index],
          );
        },
      ),
    );
  }
}