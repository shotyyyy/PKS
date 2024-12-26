import 'package:flutter/material.dart';
import '../models/video_card.dart';
import '../api/api_service.dart';

class CartScreen extends StatefulWidget {
  final Map<VideoCard, int> cartItems;

  CartScreen({required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ApiService _apiService = ApiService();

  void addToCart(VideoCard card) async {
    try {
      await _apiService.addToCart(card, 1);
      setState(() {
        widget.cartItems[card] = (widget.cartItems[card] ?? 0) + 1;
      });
    } catch (e) {
      print('Ошибка добавления в корзину: $e');
    }
  }

  void removeFromCart(VideoCard card) async {
    try {
      if (widget.cartItems[card]! > 1) {
        await _apiService.updateCartItem(card.id!, widget.cartItems[card]! - 1);
        setState(() {
          widget.cartItems[card] = widget.cartItems[card]! - 1;
        });
      } else {
        await _apiService.removeFromCart(card.id!);
        setState(() {
          widget.cartItems.remove(card);
        });
      }
    } catch (e) {
      print('Ошибка удаления из корзины: $e');
    }
  }

  double calculateTotalPrice() {
    double total = 0.0;
    widget.cartItems.forEach((videoCard, quantity) {
      total += videoCard.price * quantity;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Корзина')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final videoCard = widget.cartItems.keys.elementAt(index);
                final quantity = widget.cartItems[videoCard]!;
                return ListTile(
                  title: Text(videoCard.name),
                  subtitle: Text('Цена: ${videoCard.price} x $quantity'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => removeFromCart(videoCard),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => addToCart(videoCard),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Общая стоимость: \$${calculateTotalPrice().toStringAsFixed(2)}.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
