import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اعلان‌ها"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            NotificationCard(
              title: "تخفیف ویژه!",
              message: "از 20% تخفیف برای خریدهای بالای 200,000 تومان بهره‌مند شوید.",
              date: "1403/07/15",
            ),
            NotificationCard(
              title: "محصول جدید",
              message: "محصول جدید ما به فروشگاه اضافه شد! حتماً ببینید.",
              date: "1403/07/10",
            ),
            NotificationCard(
              title: "تغییرات در ساعات کاری",
              message: "ساعات کاری ما در روزهای جمعه تغییر کرده است.",
              date: "1403/07/05",
            ),
            // می‌توانید اعلان‌های بیشتری اضافه کنید
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.date,
  });

  final String title;
  final String message;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              date,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

