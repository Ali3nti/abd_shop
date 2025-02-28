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
                    builder: (context) =>
                        SearchPageHome(products: ProductsList),
                  ),
                );
              }
            });
          },
          child: Container(
            height: 50,
            width: 365,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            // Horizontal padding
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              // Lighter background
              borderRadius: BorderRadius.circular(8),
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
                Image.asset('assets/images/search-normal.png',color: Colors.grey.shade700,),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Image.asset(
                    'assets/images/main_logo.jpg',
                    width: 270,
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
