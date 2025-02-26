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
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductInformation(
                product: widget.product,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 290,
          width: 190,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    "assets/images/amazing5.png",
                    height: 30,
                  ),
                ),
                if (widget.product.discount == 0)
                  SizedBox(
                    height: 28,
                  ),
                if (widget.product.discount > 0)
                  Padding(
                    padding: const EdgeInsets.only(right: 110),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: SizedBox(
                        width: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/01.png",
                              color: Colors.white,
                              height: 20,
                            ),
                            Text(
                              widget.product.discount.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Stack(
                  children: [
                    Container(
                      width: 200,
                     margin: const EdgeInsets.only(top: 5),
                      child: Image.network(
                        baseUrl + widget.product.image,
                        width: 100,
                        height: 85,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 60,
                        top: 90,
                      ),
                      child: AddToCartWidget(
                        product: widget.product,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: kHeaderTextStyle,
                      ),
                      Text(
                        widget.product.description,
                        style: kMainTextStyle,
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        children: [
                          Row(
                            children: [
                              Text(
                                formatter.format(finalPrice),
                                style: kMainTextStyleOrange,
                              ),
                              const SizedBox(width: 6),
                              Image.asset(
                                width: 20,
                                'assets/images/toman.png',
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      if (widget.product.discount > 0)
                        Text(
                          formatter.format(widget.product.price),
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                    ],
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
