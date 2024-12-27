import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/screens/search/search_Page_Home.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppBarOriginal extends StatelessWidget {
  const AppBarOriginal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: () {
            List<Product> ProductsList = [];
            getProducts().then((value) {
              //Handle API Response
              DataResponse response = value;
              if (response.status == 1) {
                response.data.forEach((value) {
                  // Handle Product Data
                  ProductsList.add(Product.fromJson(value));
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPageHome(
                        products:
                            ProductsList), // انتقال به صفحه محصولات کتگوری
                  ),
                );
              }
            });
          },
          child: Container(
            height: 50,
            width: 340,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            // Horizontal padding
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              // Lighter background
              borderRadius: BorderRadius.circular(10),
              // More rounded corners
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Lottie.asset(
                  'assets/images/Animation - 1735296561432.json',height: 35,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Row(
                    children: [
                      const Text(
                        "جستجو در",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        'assets/images/logo.png',
                        color: kPrimaryColor,
                        width: 90,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
