import 'dart:async';
import 'package:abd_shop/screens/product_page_detail.dart';
import 'package:abd_shop/widget/provider_widget.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String discountedPrice;
  final String discountPercentage;
  final String quantity;
  final Color color;

  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.discountedPrice,
    required this.discountPercentage,
    required this.quantity,
    required this.color,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late Timer _timer;
  int _remainingTime = 36000; // 10 ساعت به ثانیه

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void productPageDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductPageDetail(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _remainingTime > 0, // فقط وقتی که زمان باقی‌مانده وجود دارد، نمایش داده می‌شود
      child: InkWell(
        onTap: () {
          productPageDetail(context);
        },
        child: Card(
          shadowColor: widget.color,
          color: Colors.white,
          elevation: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(widget.image, height: 80, width: 100),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          widget.discountPercentage + '%',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          children: [
                            Text(
                              widget.discountedPrice,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4),
                            Image.asset("assets/images/toman.png", height: 15),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          widget.price,
                          style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      '${widget.quantity} (${widget.quantity.substring(0, 2)} عدد)',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      'زمان باقی‌مانده : ${(_remainingTime ~/ 3600).toString().padLeft(2, '0')}:${((_remainingTime % 3600) ~/ 60).toString().padLeft(2, '0')}:${(_remainingTime % 60).toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: ProviderWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
