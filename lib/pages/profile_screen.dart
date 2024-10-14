import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Уменьшаем размер колонки до ее содержимого
            children: <Widget>[
              // Аватарка пользователя
              CircleAvatar(
                radius: 100, // Размер аватарки
                backgroundImage: NetworkImage(
                  'https://deadlocked.wiki/images/5/53/Viscous_card.png',
                ),
              ),
              SizedBox(height: 20),

              // ФИО
              Text(
                'Голиков Олег Александрович',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              // Группа
              Text(
                'Группа: ЭФБО-03-22',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),

              // Номер телефона
              Text(
                'Телефон: +7 (999) 999-99-52',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),

              // Почта
              Text(
                'Почта: viscous52@gmail.com',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
