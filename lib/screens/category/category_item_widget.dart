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
              ),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.transparent,
                child: Image.network(
                  baseUrl + category.image,
                  width: 50,
                  height: 40,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
