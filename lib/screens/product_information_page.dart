import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/widget/providwe_widget2.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductInformation extends StatefulWidget {
  ProductInformation({super.key, required this.product});

  Product product;

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  @override
  Widget build(BuildContext context) {
    double discountAmount = widget.product.price *
        (widget.product.discount / 100); //Percentage formula//
    double finalPrice = widget.product.price -
        discountAmount; // final price = Subtract the amount of discount from the original price//
    final formatter =
        NumberFormat('#,###'); //Create an instance of NumberFormat.//
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("اطلاعات محصول", style: kHeaderTextStyle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 200,
              child: Image.network(baseUrl + widget.product.image),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 20),
              color: Colors.white,
              width: double.infinity,
              height: 50,
              child: const Text(
                "مشخصات",
                style: kHeaderTextStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, right: 20),
              color: Colors.grey.shade50,
              width: double.infinity,
              height: 100,
              child: Text(
                widget.product.description,
                style: TextStyle(color: Colors.blue),
              ),
            ),
            // Container(
            //   color: Colors.white,
            //   width: double.infinity,
            //   height: 50,
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(right: 3),
            //           child: Container(
            //             padding: const EdgeInsets.only(top: 5),
            //             width: 100,
            //             height: 50,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(5),
            //                 color: Colors.grey.shade300),
            //             child: Column(
            //               children: [
            //                 Text(
            //                   "مشخصات محصول",
            //                   style: TextStyle(color: Colors.grey.shade600),
            //                 ),
            //                 const Text("مشخصات محصول"),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 3),
            //           child: Container(
            //             padding: const EdgeInsets.only(top: 5),
            //             width: 100,
            //             height: 50,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               color: Colors.grey.shade300,
            //             ),
            //             child: Column(
            //               children: [
            //                 Text(
            //                   "مشخصات محصول",
            //                   style: TextStyle(color: Colors.grey.shade600),
            //                 ),
            //                 const Text("مشخصات محصول"),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 3),
            //           child: Container(
            //             padding: const EdgeInsets.only(top: 5),
            //             width: 100,
            //             height: 50,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               color: Colors.grey.shade300,
            //             ),
            //             child: Column(
            //               children: [
            //                 Text(
            //                   "مشخصات محصول",
            //                   style: TextStyle(color: Colors.grey.shade600),
            //                 ),
            //                 const Text("مشخصات محصول"),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 3),
            //           child: Container(
            //             padding: const EdgeInsets.only(top: 5),
            //             width: 100,
            //             height: 50,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               color: Colors.grey.shade300,
            //             ),
            //             child: Column(
            //               children: [
            //                 Text(
            //                   "مشخصات محصول",
            //                   style: TextStyle(color: Colors.grey.shade600),
            //                 ),
            //                 const Text("مشخصات محصول"),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 3),
            //           child: Container(
            //             padding: const EdgeInsets.only(top: 5),
            //             width: 100,
            //             height: 50,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               color: Colors.grey.shade300,
            //             ),
            //             child: Column(
            //               children: [
            //                 Text(
            //                   "مشخصات محصول",
            //                   style: TextStyle(color: Colors.grey.shade600),
            //                 ),
            //                 const Text("مشخصات محصول"),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 3),
            //           child: Container(
            //             padding: const EdgeInsets.only(top: 5),
            //             width: 100,
            //             height: 50,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               color: Colors.grey.shade300,
            //             ),
            //             child: Column(
            //               children: [
            //                 Text(
            //                   "مشخصات محصول",
            //                   style: TextStyle(color: Colors.grey.shade600),
            //                 ),
            //                 const Text("مشخصات محصول"),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 3),
            //           child: Container(
            //             padding: const EdgeInsets.only(top: 5),
            //             width: 100,
            //             height: 50,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               color: Colors.grey.shade300,
            //             ),
            //             child: Column(
            //               children: [
            //                 Text(
            //                   "مشخصات محصول",
            //                   style: TextStyle(color: Colors.grey.shade600),
            //                 ),
            //                 const Text("مشخصات محصول"),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 20),
              color: Colors.white,
              width: double.infinity,
              height: 50,
              child: const Text(
                "فروشنده",
                style: kHeaderTextStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 10),
              color: Colors.grey.shade50,
              width: double.infinity,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.store,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: 10),
                      Text("اسم فروشگاه"),
                      SizedBox(width: 20),
                      Text("منتخب"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(right: 35),
                    child: const Row(
                      children: [
                        Text("عملکرد"),
                        SizedBox(width: 20),
                        Text("عالی"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(Icons.safety_check_outlined),
                      SizedBox(width: 10),
                      Text("گارانتی اصالت و سلامت فیزیکی"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 10),
              color: Colors.grey.shade50,
              height: 50,
              child: const Row(
                children: [
                  Icon(
                    Icons.fire_truck,
                    color: kPrimaryColor,
                  ),
                  SizedBox(width: 10),
                  Text("ارسال آباده شاپ"),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 10),
              color: Colors.grey.shade50,
              height: 50,
              child: Row(
                children: [
                  Icon(Icons.stars, color: kPrimaryColor),
                  SizedBox(width: 10),
                  Text(widget.product.rating.toString()),
                ],
              ),
            ),
            const SizedBox(height: 5),
            // Container(
            //   padding: const EdgeInsets.only(top: 10, right: 10),
            //   color: Colors.grey.shade50,
            //   height: 50,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       const Text("گزارش نادرستی مشخصات"),
            //       const SizedBox(width: 10),
            //       Icon(Icons.report, color: Colors.red.shade900),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 10),
              color: Colors.grey.shade50,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.check_box, color: kPrimaryColor),
                      SizedBox(width: 10),
                      Text("تعداد باقیمانده در انبار"),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 170),
                         child: ProviderWidget2(),
                       ),
                      Text(
                        formatter.format(finalPrice),
                      ),
                      Image.asset("assets/images/toman.png",
                          width: 25, height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
