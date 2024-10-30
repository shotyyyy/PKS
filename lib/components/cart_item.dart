import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String title;
  final int price;

  CartItem({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white to match the Catalog
        border: Border.all(color: Colors.grey), // Adding a border similar to ServiceItem
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16),
                    maxLines: 2, // Limit to two lines
                    overflow: TextOverflow.ellipsis, // Add ellipsis if it overflows
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$price ₽', style: TextStyle(color: Colors.grey)),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {},
                    ),
                    Text('|'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
