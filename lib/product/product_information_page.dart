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

class _ProductInformationState extends State<ProductInformation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double discountAmount =
        widget.product.price * (widget.product.discount / 100);
    double finalPrice = widget.product.price - discountAmount;
    final formatter = NumberFormat('#,###');

    return Scaffold(
      backgroundColor: Colors.white,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(_controller),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 5, left: 5),
                    width: 360,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        baseUrl + widget.product.image,
                        height: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 3,
              color: Colors.grey.shade200,
            ),

            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(_controller),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      widget.product.name,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Text("/"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "برند ",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(_controller),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Row(
                  children: [
                    Text(
                      widget.product.name,
                      style: kHeaderTextStyle,
                    ),
                    Text(
                      " - ",
                      style: kHeaderTextStyle,
                    ),
                    Text(
                      widget.product.description,
                      style: kHeaderTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(_controller),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/star.png",
                      color: Colors.orange,
                    ),
                    Text(
                      widget.product.rating.toString(),
                      style: kHeaderTextStyle,
                    ),
                    Text(
                      "(123)",
                      style: kHeaderTextStyle2,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.circle,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "150 دیدگاه کاربران",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "5 پرسش و پاسخ",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(_controller),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/like.png",
                      color: Colors.green,
                    ),
                    Text(
                        "70%(100 نفر) از خریداران،این کالا را پیشنهاد داده اند")
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 8,
              color: Colors.grey.shade200,
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(_controller),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/shop.png",
                      color: Colors.red.shade700,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "فروشنده",
                      style: kHeaderTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(_controller),
              child: Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Row(
                  children: [
                    Text(
                      "سوپرمارکت سورنا",
                      style: kHeaderTextStyle,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 30,
                      width: 2,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "عملکرد:",
                      style: kHeaderTextStyle,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "عالی",
                      style:
                          TextStyle(fontSize: 17, color: Colors.green.shade900),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 2,
              color: Colors.grey.shade200,
              indent: 50,
              endIndent: 50,
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(_controller),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/tick.png",
                      color: Colors.purple,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "گارانتی :",
                      style: kHeaderTextStyle,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(widget.product.warranty)
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.grey.shade200,
              indent: 50,
              endIndent: 50,
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(_controller),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/bar.jpg",
                      height: 50,
                    ),
                    Text(
                      "موجودی در انبار:",
                      style: kHeaderTextStyle,
                    ),
                    Text(
                      widget.product.stockQuantity.toString(),
                      style: kHeaderTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 8,
              color: Colors.grey.shade200,
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(_controller),
              child: Padding(
                padding: const EdgeInsets.only(top: 70, right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ProviderWidget2(),
                    Row(
                      children: [
                        Text(
                          formatter.format(finalPrice),
                          style: kHeaderTextStyle.copyWith(fontSize: 20),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
