import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/product/product_information_page.dart';
import 'package:abd_shop/widget/provider/add_to_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    double discountAmount =
        widget.product.price * (widget.product.discount / 100);
    double finalPrice = widget.product.price - discountAmount;
    final formatter = NumberFormat('#,###');

    return Container(
      width: 150,
      height: 260,
      margin: EdgeInsets.fromLTRB(10, 18, 10, 28),
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductInformation(product: widget.product),
              ),
            );
          },
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 85),
                  child: widget.product.discount > 0
                      ? Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.shade700,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.product.discount.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                        Image.asset(
                          "assets/images/01.png",
                          color: Colors.white,
                          height: 15,
                        ),
                      ],
                    ),
                  )
                      : SizedBox.shrink(), // اگر تخفیف صفر باشد، هیچ چیزی نمایش داده نمی‌شود
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Image.network(baseUrl + widget.product.image,
                          height: 80, width: 100),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, top: 80),
                      child: AddToCartWidget(
                        product: widget.product,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        widget.product.name,
                        style: const TextStyle(
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
                              Text(
                                widget.product.discount > 0
                                    ? formatter.format(finalPrice)
                                    : formatter.format(widget.product.price),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Image.asset("assets/images/toman.png",
                                  height: 15),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (widget.product.discount > 0) ...[
                          Padding(
                            padding: const EdgeInsets.only(left: 80),
                            child: Text(
                              formatter.format(widget.product.price),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
