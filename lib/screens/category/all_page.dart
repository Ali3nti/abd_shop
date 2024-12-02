import 'dart:math';
import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/widget/my_app_bar.dart';
import 'package:abd_shop/widget/provider/add_to_cart_widget.dart';
import 'package:flutter/material.dart';

class AllPage extends StatefulWidget {
  const AllPage({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 50,
              // color: Colors.red,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.line_weight,
                    color: Colors.black,
                    size: 18,
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade200,
                    ),
                    child: const Center(
                      child: Text("همه محصولات"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 20),
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 50,
              //color: Colors.blue,
              child: const Text(
                "12 محصول",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  width: 203,
                  height: 300,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(top: 50),
                          //  color: Colors.orange,
                          child: Image.network(baseUrl + widget.product.image,
                              height: 80, width: 100),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 100),
                        child: AddToCartWidget(
                          product: Product(),
                        ),
                      ),
                      const Text("widget.product.price.toString()",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text("widget.product.name",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(width: 2),
                          Text("widget.product.discount.toString()"),
                        ],
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
