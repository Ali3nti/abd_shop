import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/widget/provider_widget.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  ProductCard({super.key,required this.productModel});
  Product productModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(width: 140,height: 220,
      child: InkWell(
        child: Card(
          shadowColor: Colors.red,
          color: Colors.white,
          elevation: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Image.network(baseUrl +widget.productModel.image, height: 80, width: 100),
                  ),
                  // Positioned.fill(
                  //   child: Align(
                  //     alignment: Alignment.topRight,
                  //     child: Container(
                  //       padding: EdgeInsets.all(8),
                  //       decoration: BoxDecoration(
                  //         color: Colors.deepOrange,
                  //         borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(10),
                  //           bottomRight: Radius.circular(10),
                  //         ),
                  //       ),
                  //       child: Text(
                  //         widget.productModel.discount as String,
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      widget.productModel.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: Row(
                          children: [
                            // Text(
                            //   widget.productModel.price,
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     color: Colors.red,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            SizedBox(width: 4),
                            Image.asset("assets/images/toman.png", height: 15),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 8),
                      //   child: Text(
                      //     widget.price,
                      //     style: TextStyle(
                      //       fontSize: 14,
                      //       decoration: TextDecoration.lineThrough,
                      //       color: Colors.grey,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      '${widget.productModel.stockQuantity} (${widget.productModel.stockQuantity} عدد)',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 8.0),
                  //   child: Text(
                  //     'زمان باقی‌مانده : ${(_remainingTime ~/ 3600).toString().padLeft(2, '0')}:${((_remainingTime % 3600) ~/ 60).toString().padLeft(2, '0')}:${(_remainingTime % 60).toString().padLeft(2, '0')}',
                  //     style: TextStyle(
                  //       fontSize: 14,
                  //       color: Colors.red,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70,top: 10),
                child: ProviderWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
