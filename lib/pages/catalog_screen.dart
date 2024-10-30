import 'package:flutter/material.dart';
import '../components/service_item.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Каталог услуг',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adjusted padding for better scaling
        child: Column(
          children: [
            ServiceItem(
              title: 'ПЦР-тест на определение РНК коронавируса стандартный',
              duration: '2 дня',
              price: 1800,
            ),
            ServiceItem(
              title: 'Клинический анализ крови с лейкоцитарной формулировкой',
              duration: '1 день',
              price: 690,
            ),
            ServiceItem(
              title: 'Биохимический анализ крови, базовый',
              duration: '1 день',
              price: 2440,
            ),
          ],
        ),
      ),
    );
  }
}
