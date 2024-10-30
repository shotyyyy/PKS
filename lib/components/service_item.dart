import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final String title;
  final String duration;
  final int price;

  ServiceItem({required this.title, required this.duration, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Adjusted padding for better scaling
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16)),
            SizedBox(height: 4),
            Text(duration, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$price ₽', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Добавить', style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
