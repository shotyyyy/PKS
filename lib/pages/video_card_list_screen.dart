import 'package:flutter/material.dart';
import '../models/video_card.dart';
import '../components/video_card_item.dart';
import 'video_card_detail_screen.dart';
import 'add_video_card_screen.dart';
import '../api/api_service.dart';

class VideoCardListScreen extends StatefulWidget {
  final List<VideoCard> favoriteCards;
  final Function(VideoCard) toggleFavorite;
  final Function(VideoCard) addToCart;

  VideoCardListScreen({
    required this.favoriteCards,
    required this.toggleFavorite,
    required this.addToCart,
  });

  @override
  _VideoCardListScreenState createState() => _VideoCardListScreenState();
}

class _VideoCardListScreenState extends State<VideoCardListScreen> {
  List<VideoCard> videoCards = [];
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    loadVideoCards();
  }

  Future<void> loadVideoCards() async {
    try {
      final cards = await _apiService.getCards();
      setState(() {
        videoCards = cards;
      });
    } catch (e) {
      print('Ошибка загрузки видеокарт: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Не удалось загрузить видеокарты')),
      );
    }
  }


  void confirmDelete(VideoCard card) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Удалить товар'),
          content: Text('Вы уверены, что хотите удалить этот товар?'),
          actions: <Widget>[
            TextButton(
              child: Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Удалить'),
              onPressed: () async {
                if (card.id != null) {
                  try {
                    await _apiService.deleteCard(card.id!);
                    setState(() {
                      videoCards.remove(card);
                    });
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Товар удалён')),
                    );
                  } catch (e) {
                    print('Ошибка удаления: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Не удалось удалить товар')),
                    );
                  }
                } else {
                  print('Ошибка: id равен null');
                }
              },
            ),
          ],
        );
      },
    );
  }

  void viewDetails(VideoCard card) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(videoCard: card),
      ),
    );
  }

  void addNewVideoCard(VideoCard newCard) async {
    try {
      final addedCard = await _apiService.createCard(newCard);
      setState(() {
        videoCards.add(addedCard);
      });
    } catch (e) {
      print('Ошибка добавления видеокарты: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Список видеокарт')),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: videoCards.length,
        itemBuilder: (context, index) {
          final videoCard = videoCards[index];
          return VideoCardItem(
            videoCard: videoCard,
            isFavorite: widget.favoriteCards.contains(videoCard),
            onFavoriteToggle: () => widget.toggleFavorite(videoCard),
            onDelete: () => confirmDelete(videoCard),
            onViewDetails: () => viewDetails(videoCard),
            onAddToCart: () => widget.addToCart(videoCard),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newCard = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddVideoCardScreen()),
          );

          if (newCard != null) {
            addNewVideoCard(newCard);
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}