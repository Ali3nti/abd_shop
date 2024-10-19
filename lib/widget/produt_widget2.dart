import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String discountedPrice;
  final String discountPercentage;
  final String quantity;

  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.discountedPrice,
    required this.discountPercentage,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(margin: EdgeInsets.all(100),
      elevation: 20,
      child: Container(
        height: 300, // ارتفاع مشخص برای جلوگیری از overflow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(image, height: 100, width: 100),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        discountPercentage + '%',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        discountedPrice,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${quantity} (${quantity.substring(0, 2)} عدد)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(), // اینجا برای ایجاد فضای خالی بین محتوا و دکمه
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  heroTag: "button",
                  onPressed: () {},
                  backgroundColor: Colors.orange.shade900,
                  foregroundColor: Colors.white,
                  isExtended: true,
                  shape: const CircleBorder(
                    eccentricity: 0,
                  ),
                  label: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
