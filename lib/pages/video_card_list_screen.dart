import 'package:flutter/material.dart';
import '../models/video_card.dart';
import '../components/video_card_item.dart';
import 'add_video_card_screen.dart';

class VideoCardListScreen extends StatefulWidget {
  @override
  _VideoCardListScreenState createState() => _VideoCardListScreenState();
}

class _VideoCardListScreenState extends State<VideoCardListScreen> {
  List<VideoCard> videoCards = [
    VideoCard(
      name: 'NVIDIA GeForce RTX 3080',
      description:
      'Топовая настольная видеокарта с архитектурой Ampere. Здесь используется чип GA102 с 8704 ядрами и 10 ГБ видеопамяти GDDR6X. Производительность в играх при 4K разрешении заметно выше, чем у RTX 2080 Ti - примерно на 15%.',
      imageUrl:
      'https://ir.ozone.ru/s3/multimedia-1-t/wc1000/6923180405.jpg',
      price: 899.99,
    ),
    VideoCard(
      name: 'AMD Radeon RX 6800 XT',
      description:
      'Видеокарта GIGABYTE AMD Radeon RX 6800 XT GAMING OC выполнена в корпусе длиной 286 мм и толщиной 58 мм. Для установки используется всего 2.75 слота расширения, а подключение осуществляется при помощи PCI-E 4.0. Также видеокарта нуждается в дополнительном питании, для которого предусмотрено 2 разъема на 8-pin.',
      imageUrl:
      'https://ir.ozone.ru/s3/multimedia-l/wc1000/6346425465.jpg',
      price: 649.99,
    ),
    VideoCard(
      name: 'NVIDIA GeForce GTX 1660 Super',
      description:
      'Благодаря GDDR6 видеопамяти объемом 6 ГБ и ширине шины видеопамяти в 192 бита, эта видеокарта способна оперативно обрабатывать сложные графические задачи и обеспечивать плавный процесс игры. Превосходная производительность благодаря базовой частоте в 1530 МГц и частоте в режиме ускорения до 1830 МГц.',
      imageUrl:
      'https://ir.ozone.ru/s3/multimedia-1-n/wc1000/7087753283.jpg',
      price: 229.99,
    ),
    VideoCard(
      name: 'AMD Radeon RX 5700',
      description:
      'Это первые коммерческие версии игровых ускорителей на базе архитектуры RDNA из линейки Navi. Видеокарты серии AMD Radeon RX 5700 основаны на памяти GDDR6 и поддерживают интерфейс PCIe 4.0.',
      imageUrl:
      'https://ir-3.ozone.ru/s3/multimedia-1-j/wc1000/7139386855.jpg',
      price: 349.99,
    ),
  ];

  void _removeVideoCard(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Вы уверены?"),
          content: Text("Вы действительно хотите удалить этот товар?"),
          actions: [
            TextButton(
              child: Text("Отмена"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Удалить"),
              onPressed: () {
                setState(() {
                  videoCards.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _addVideoCard(VideoCard newCard) {
    setState(() {
      videoCards.add(newCard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список видеокарт'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddVideoCardScreen(onAdd: _addVideoCard),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: videoCards.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (direction) {
              _removeVideoCard(index);
            },
            child: VideoCardItem(
              videoCard: videoCards[index],
            ),
          );
        },
      ),
    );
  }
}