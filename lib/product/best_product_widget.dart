import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/product/product_information_page.dart';
import 'package:abd_shop/widget/provider/add_to_cart_widget.dart';
import 'package:flutter/material.dart';

class BestProducts extends StatefulWidget {
  BestProducts({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  State<BestProducts> createState() => _BestProductsState();
}

class _BestProductsState extends State<BestProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9, // عرض 90% از صفحه
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(5),
                color: Colors.white,
                child: Row(
                  children: [
                    Image.network(
                      baseUrl + widget.product.image,
                      width: 80,
                      height: 85,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          widget.product.id.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.product.name,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
