import 'package:flutter/material.dart';
import '../models/video_card.dart';

class AddVideoCardScreen extends StatefulWidget {
  @override
  _AddVideoCardScreenState createState() => _AddVideoCardScreenState();
}

class _AddVideoCardScreenState extends State<AddVideoCardScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String description = '';
  String imageUrl = '';
  double price = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Добавить видеокарту')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Название видеокарты'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите название';
                  }
                  return null;
                },
                onSaved: (value) => name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Описание'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите описание';
                  }
                  return null;
                },
                onSaved: (value) => description = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Ссылка на изображение'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите ссылку на изображение';
                  }
                  return null;
                },
                onSaved: (value) => imageUrl = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Цена'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите цену';
                  }
                  return null;
                },
                onSaved: (value) => price = double.parse(value!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newCard = VideoCard(
                      name: name,
                      description: description,
                      imageUrl: imageUrl,
                      price: price,
                    );
                    Navigator.pop(context, newCard);
                  }
                },
                child: Text('Добавить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
