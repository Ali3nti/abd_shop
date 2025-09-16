import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/discount_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/product/product_information_page.dart';
import 'package:abd_shop/widget/provider/add_to_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AmazingItemWidget extends StatefulWidget {
  AmazingItemWidget({
    super.key,
    required this.product,
  });

  Product product;

  @override
  State<AmazingItemWidget> createState() => _AmazingItemWidgetState();
}

class _AmazingItemWidgetState extends State<AmazingItemWidget> {
  late DiscountModel discountModel;

  @override
  Widget build(BuildContext context) {
    double discountAmount =
        widget.product.price * (widget.product.discount / 100);
    double finalPrice = widget.product.price - discountAmount;
    final formatter = NumberFormat('#,###');

    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20, right: 10, left: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductInformation(product: widget.product),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 270,
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 150,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadiusDirectional.circular(15),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15,),
                      child: Image.network(baseUrl + widget.product.image,
                          width: 100),
                    ),
                  ),
                  if (widget.product.discount > 0)
                    Padding(
                      padding: const EdgeInsets.only(right: 110, ),
                      child: Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.shade500,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/01.png",
                              color: Colors.white,
                              height: 14,
                            ),
                            Text(
                              widget.product.discount.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 110),
                    child: Container(
                      child: Center(
                        child: Image.asset("assets/images/amazing5.png"),
                      ),
                      width: 150,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  widget.product.name,
                  style: kHeaderTextStyle3
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 3),
                child: Text(
                  formatter.format(widget.product.price),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.white60,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8, top: 3),
                        child: Text(
                          formatter.format(finalPrice), // قیمت نهایی
                          style: kHeaderTextStyle3
                        ),
                      ),
                      Image.asset(
                        'assets/images/toman2.png',
                        height: 20,
                        color: Colors.white,
                      )
                    ],
                  ),
                  AddToCartWidget(product: widget.product),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
