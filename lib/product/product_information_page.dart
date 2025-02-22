import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/widget/provider/providwe_widget2.dart';
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
    double discountAmount =
        widget.product.price * (widget.product.discount / 100); // فرمول درصد
    double finalPrice = widget.product.price -
        discountAmount; // قیمت نهایی = کسر مبلغ تخفیف از قیمت اصلی
    final formatter = NumberFormat('#,###'); // ایجاد یک نمونه از NumberFormat

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          'اطلاعات محصول',
          style: TextStyle(
            color: kWhiteColor,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 5,left: 5),
              color: Colors.white,
              width: double.infinity,
              height: 200,
              child: Image.network(
                baseUrl + widget.product.image,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, right: 20),
              color: Colors.white,
              width: double.infinity,
              height: 70,
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
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, right: 20),
              color: Colors.white,
              width: double.infinity,
              height: 70,
              child: const Text(
                "فروشنده",
                style: kHeaderTextStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 10),
              color: Colors.grey.shade50,
              width: double.infinity,
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.store,
                        color: kPrimaryColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.product.storeName.isNotEmpty
                            ? widget.product.storeName
                            : "نام فروشگاه نامشخص",
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(right: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("عملکرد"),
                        Text(widget.product.comments ?? "بدون نظر"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.safety_check_outlined,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "گارانتی :  ",
                      ),
                      const SizedBox(width: 5),
                      Text(widget.product.warranty.isNotEmpty
                          ? widget.product.warranty
                          : " بدون گارانتی "),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 10),
              color: Colors.grey.shade50,
              height: 70,
              child: const Row(
                children: [
                  Icon(
                    Icons.fire_truck,
                    color: kPrimaryColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "ارسال آباده شاپ",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 10),
              color: Colors.grey.shade50,
              height: 70,
              child: Row(
                children: [
                  const Icon(
                    Icons.stars,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.product.rating.toString(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey.shade50,
              height: 150,
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.check_box,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "تعداد باقیمانده در انبار: ",
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        widget.product.stockQuantity.toString(),
                        style: TextStyle(
                          backgroundColor: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ProviderWidget2(),
                      Row(
                        children: [
                          Text(
                            formatter.format(finalPrice),
                            style: kHeaderTextStyle,
                          ),
                          const SizedBox(width: 5),
                          Image.asset(
                            width: 20,
                            'assets/images/toman.png',
                          ),
                        ],
                      ),
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
