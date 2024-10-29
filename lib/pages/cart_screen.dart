import 'package:flutter/material.dart';
import '../models/video_card.dart';

class CartScreen extends StatelessWidget {
  final Map<VideoCard, int> cartItems;
  final Function(VideoCard) addToCart;
  final Function(VideoCard) removeFromCart;

  CartScreen({
    required this.cartItems,
    required this.addToCart,
    required this.removeFromCart,
  });

  double calculateTotalPrice() {
    double total = 0.0;
    cartItems.forEach((videoCard, quantity) {
      total += videoCard.price * quantity;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final videoCard = cartItems.keys.elementAt(index);
                final quantity = cartItems[videoCard]!;
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
