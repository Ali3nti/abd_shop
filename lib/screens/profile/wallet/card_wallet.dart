import 'package:flutter/material.dart';

class CardWallet extends StatelessWidget {
  const CardWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "موجودی فعلی",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "۱,۵۰۰,۰۰۰ تومان",
              style: TextStyle(fontSize: 32, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
