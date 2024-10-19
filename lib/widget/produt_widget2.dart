import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String discountedPrice;
  final String discountPercentage;
  final String quantity;
  final Color color;

  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.discountedPrice,
    required this.discountPercentage,
    required this.quantity, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(shadowColor: color,
      elevation: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(image, height: 100, width: 130),
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
          Column(
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
          SizedBox(width: 40,
            child: FloatingActionButton.extended(
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
          ),
        ],
      ),
    );
  }
}
