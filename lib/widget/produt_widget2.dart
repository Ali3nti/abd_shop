import 'package:abd_shop/screens/product_page_detail.dart';
import 'package:abd_shop/widget/provider_widget.dart';
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
  productPageDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductPageDetail(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){productPageDetail(context);},
      child: Card(shadowColor: color,
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
      Padding(
      padding: const EdgeInsets.only(left: 100),
      child: ProviderWidget(),
      ),
      ],
        ),
      ),
    );
  }
}
