import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/screens/category/all_page.dart';
import 'package:abd_shop/screens/category/category_Page.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:flutter/material.dart';

class OutLinedButtonWidget extends StatefulWidget {
  const OutLinedButtonWidget({super.key});

  @override
  State<OutLinedButtonWidget> createState() => _OutLinedButtonWidgetState();
}

class _OutLinedButtonWidgetState extends State<OutLinedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        List<Product> categoryProductsList = [];
          getProducts().then((value) {
            DataResponse response = value;
            if (response.status == 1) {
              response.data.forEach((value) {
                categoryProductsList
                    .add(Product.fromJson(value));
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
      child: const Text(
        "میوه",
      ),
    );
  }
}
