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

    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20, right: 20),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 260,
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 180,
                    height: 115,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Image.network(baseUrl + widget.product.image,
                          width:90),
                    ),
                  ),
                  // نمایش کانتینر تخفیف فقط اگر درصد تخفیف بیشتر از صفر باشد
                  if (widget.product.discount > 0)
                    Padding(
                      padding: const EdgeInsets.only(right: 140, top: 1),
                      child: Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
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
                              height: 15,
                            ),
                            Text(
                              widget.product.discount.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ),
                  // نمایش کانتینر تصویر "amazing" فقط اگر درصد تخفیف بیشتر از صفر باشد
                  if (widget.product.discount > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Container(
                        child: Center(
                          child: Image.asset(
                            "assets/images/amazing5.png",
                            width: 200,
                          ),
                        ),
                        width: 180,
                        height: 25,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 0),
                            ),
                          ],
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
              if(widget.product.discount == 0) SizedBox(height: 20,),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  widget.product.name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              if(widget.product.discount == 0) SizedBox(height: 25,),

              // نمایش قیمت اصلی فقط اگر درصد تخفیف بیشتر از صفر باشد
              if (widget.product.discount > 0)
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 3),
                  child: Text(
                    formatter.format(widget.product.price), // قیمت اصلی
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.black,
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
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/toman2.png',
                        height: 20,
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
