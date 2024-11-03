import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/category_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/screens/home/components/category_Page.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        List<Product> categoryProductsList = [];
        getProductsOfCategory(category.id).then((value) {
          //Handle API Response
          DataResponse response = value;
          if (response.status == 1) {
            response.data.forEach((value) {
              // Handle Product Data
              categoryProductsList.add(Product.fromJson(value));
            });

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPage(
                    category: category,
                    products:
                        categoryProductsList), // انتقال به صفحه محصولات کتگوری
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
                  color: Colors.blue.withOpacity(0.5),
                  blurRadius: 5,
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
    );
  }
}
