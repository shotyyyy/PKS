import 'package:flutter/material.dart';
import '../models/video_card.dart';

class AddVideoCardScreen extends StatefulWidget {
  final Function(VideoCard) onAdd;

  AddVideoCardScreen({required this.onAdd});

  @override
  _AddVideoCardScreenState createState() => _AddVideoCardScreenState();
}

class _AddVideoCardScreenState extends State<AddVideoCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newVideoCard = VideoCard(
        name: _nameController.text,
        description: _descriptionController.text,
        imageUrl: _imageUrlController.text,
        price: double.tryParse(_priceController.text) ?? 0.0,
      );
      widget.onAdd(newVideoCard);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить видеокарту'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Название'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите название';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Описание'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите описание';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Цена'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'Введите корректную цену';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'URL изображения'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите URL изображения';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Добавить товар'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
