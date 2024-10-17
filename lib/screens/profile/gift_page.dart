import 'package:flutter/material.dart';

class GiftCardPage extends StatelessWidget {
  const GiftCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('کارت‌های هدیه'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: giftCards.length,
          itemBuilder: (context, index) {
            return GiftCardItem(giftCard: giftCards[index]);
          },
        ),
      ),
    );
  }
}

class GiftCardItem extends StatelessWidget {
  final GiftCard giftCard;

  const GiftCardItem({Key? key, required this.giftCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            giftCard.imagePath,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            giftCard.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            '${giftCard.value} تومان',
            style: const TextStyle(fontSize: 16, color: Colors.green),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement gift card purchase functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${giftCard.title} خریداری شد!')),
              );
            },
            child: const Text('خریداری کنید'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GiftCard {
  final String title;
  final String imagePath;
  final double value;

  GiftCard({required this.title, required this.imagePath, required this.value});
}

// Dummy data for gift cards
final List<GiftCard> giftCards = [
  GiftCard(title: 'کارت هدیه 50,000 تومان', imagePath: 'assets/images/gift1.png', value: 50000),
  GiftCard(title: 'کارت هدیه 100,000 تومان', imagePath: 'assets/images/gift2.png', value: 100000),
  GiftCard(title: 'کارت هدیه 200,000 تومان', imagePath: 'assets/images/gift3.png', value: 200000),
  GiftCard(title: 'کارت هدیه 500,000 تومان', imagePath: 'assets/images/gift4.png', value: 500000),
];
