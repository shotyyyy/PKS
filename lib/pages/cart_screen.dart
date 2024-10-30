import 'package:flutter/material.dart';
import '../components/cart_item.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Корзина', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adjusted padding for better scaling
        child: Column(
          children: [
            CartItem(
              title: 'Клинический анализ крови с лейкоцитарной формулировкой',
              price: 690,
            ),
            CartItem(
              title: 'ПЦР-тест на определение РНК коронавируса стандартный',
              price: 1800,
            ),
            SizedBox(height: 20),
            _buildTotal(),
            Spacer(),
            _buildCheckoutButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Row _buildTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Сумма', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        Text('2490 ₽', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      ],
    );
  }

  ElevatedButton _buildCheckoutButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 48),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text('Перейти к оформлению заказа', style: TextStyle(color: Colors.white, fontSize: 17)),
    );
  }
}
