import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/category_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/screens/category/category_Page.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.category,
    required this.index,
  });

  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    final List<Color> categoryColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.yellow,
      Colors.pink,
      Colors.deepOrange,
      Colors.tealAccent,
      Colors.green,
    ];
    Color categoryColor = categoryColors[index % categoryColors.length];

    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          List<Product> categoryProductsList = [];
          getProductsOfCategory(category.id).then((value) {
            DataResponse response = value;
            if (response.status == 1) {
              response.data.forEach((value) {
                categoryProductsList.add(Product.fromJson(value));
              });

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    category: category,
                    products: categoryProductsList,
                  ),
                ),
              );
            }
          });
        },
        radius: 16,
        borderRadius: BorderRadius.circular(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: categoryColor.withOpacity(0.5),
                    blurRadius:10,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.transparent,
                child: Image.network(
                  baseUrl + category.image,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
