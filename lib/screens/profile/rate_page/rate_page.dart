import 'package:flutter/material.dart';

class RatePage extends StatelessWidget {
  const RatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("نظرات من"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildCommentCard(
              productName: "نوشیدنی بلوبری",
              date: "1403/07/15",
              comment: "محصول عالی بود! حتماً دوباره خرید می‌کنم.",
            ),
            _buildCommentCard(
              productName: "پنیر",
              date: "1403/07/12",
              comment: "کیفیت خوب بود، اما قیمت کمی بالا بود.",
            ),
            _buildCommentCard(
              productName: "نوشابه پپسی",
              date: "1403/07/10",
              comment: "محصول معمولی بود، انتظار بیشتری داشتم.",
            ),
            // می‌توانید نظرات بیشتری اضافه کنید
          ],
        ),
      ),
    );
  }

  Widget _buildCommentCard({
    required String productName,
    required String date,
    required String comment,
  }) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              comment,
              style: const TextStyle(fontSize: 16),
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
