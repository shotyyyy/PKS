import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Эдуард', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Reduced padding for better scaling
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text('+7 900 800-55-33', style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 15, fontWeight: FontWeight.normal)),
            SizedBox(height: 4),
            Text('email@gmail.com', style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 15, fontWeight: FontWeight.normal)),
            SizedBox(height: 40), // Adjusted height for better spacing
            ListTile(
              leading: Image.asset(
                'assets/icons/orders.png', // Путь к вашему значку
                width: 24,
                height: 24,
              ),
              title: Text('Мои заказы', style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/medical-records.png',
                width: 24,
                height: 24,
              ),
              title: Text('Медицинские карты', style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/addresses.png',
                width: 24,
                height: 24,
              ),
              title: Text('Мои адреса', style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/settings.png',
                width: 24,
                height: 24,
              ),
              title: Text('Настройки', style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            Spacer(),
            _buildFooterButtons(),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: TextStyle(fontSize: 18)),
      onTap: onTap,
    );
  }

  Column _buildFooterButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton(
          onPressed: () {},
          child: Text('Ответы на вопросы', style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 15, fontWeight: FontWeight.normal)),
        ),
        SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: Text('Политика конфиденциальности', style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 15, fontWeight: FontWeight.normal)),
        ),
        SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: Text('Пользовательское соглашение', style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 15, fontWeight: FontWeight.normal)),
        ),
        SizedBox(height: 30),
        TextButton(
          onPressed: () {},
          child: Text('Выход', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
